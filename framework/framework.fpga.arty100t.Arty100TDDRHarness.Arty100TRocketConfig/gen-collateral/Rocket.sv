module Rocket(
  input         clock,
                reset,
                io_hartid,
                io_interrupts_debug,
                io_interrupts_mtip,
                io_interrupts_msip,
                io_interrupts_meip,
                io_imem_resp_valid,
                io_imem_resp_bits_btb_taken,
                io_imem_resp_bits_btb_bridx,
  input  [33:0] io_imem_resp_bits_pc,
  input  [31:0] io_imem_resp_bits_data,
  input         io_imem_resp_bits_xcpt_pf_inst,
                io_imem_resp_bits_xcpt_gf_inst,
                io_imem_resp_bits_xcpt_ae_inst,
                io_imem_resp_bits_replay,
                io_imem_gpa_valid,
                io_dmem_req_ready,
                io_dmem_s2_nack,
                io_dmem_resp_valid,
  input  [6:0]  io_dmem_resp_bits_tag,
  input  [63:0] io_dmem_resp_bits_data,
  input         io_dmem_resp_bits_replay,
                io_dmem_resp_bits_has_data,
  input  [63:0] io_dmem_resp_bits_data_word_bypass,
  input         io_dmem_replay_next,
                io_dmem_s2_xcpt_ma_ld,
                io_dmem_s2_xcpt_ma_st,
                io_dmem_s2_xcpt_pf_ld,
                io_dmem_s2_xcpt_pf_st,
                io_dmem_s2_xcpt_gf_ld,
                io_dmem_s2_xcpt_gf_st,
                io_dmem_s2_xcpt_ae_ld,
                io_dmem_s2_xcpt_ae_st,
                io_dmem_ordered,
                io_dmem_perf_grant,
                io_fpu_fcsr_flags_valid,
  input  [4:0]  io_fpu_fcsr_flags_bits,
  input  [31:0] io_fpu_store_data,
  input  [63:0] io_fpu_toint_data,
  input         io_fpu_fcsr_rdy,
                io_fpu_nack_mem,
                io_fpu_illegal_rm,
                io_fpu_dec_wen,
                io_fpu_dec_ren1,
                io_fpu_dec_ren2,
                io_fpu_dec_ren3,
                io_fpu_sboard_set,
  output        io_imem_might_request,
                io_imem_req_valid,
  output [33:0] io_imem_req_bits_pc,
  output        io_imem_req_bits_speculative,
                io_imem_sfence_valid,
                io_imem_resp_ready,
                io_imem_btb_update_valid,
                io_imem_bht_update_valid,
                io_imem_flush_icache,
                io_dmem_req_valid,
  output [33:0] io_dmem_req_bits_addr,
  output [6:0]  io_dmem_req_bits_tag,
  output [4:0]  io_dmem_req_bits_cmd,
  output [1:0]  io_dmem_req_bits_size,
  output        io_dmem_req_bits_signed,
  output [1:0]  io_dmem_req_bits_dprv,
  output        io_dmem_req_bits_dv,
                io_dmem_s1_kill,
  output [63:0] io_dmem_s1_data_data,
  output        io_ptw_status_debug,
                io_ptw_pmp_0_cfg_l,
  output [1:0]  io_ptw_pmp_0_cfg_a,
  output        io_ptw_pmp_0_cfg_x,
                io_ptw_pmp_0_cfg_w,
                io_ptw_pmp_0_cfg_r,
  output [29:0] io_ptw_pmp_0_addr,
  output [31:0] io_ptw_pmp_0_mask,
  output        io_ptw_pmp_1_cfg_l,
  output [1:0]  io_ptw_pmp_1_cfg_a,
  output        io_ptw_pmp_1_cfg_x,
                io_ptw_pmp_1_cfg_w,
                io_ptw_pmp_1_cfg_r,
  output [29:0] io_ptw_pmp_1_addr,
  output [31:0] io_ptw_pmp_1_mask,
  output        io_ptw_pmp_2_cfg_l,
  output [1:0]  io_ptw_pmp_2_cfg_a,
  output        io_ptw_pmp_2_cfg_x,
                io_ptw_pmp_2_cfg_w,
                io_ptw_pmp_2_cfg_r,
  output [29:0] io_ptw_pmp_2_addr,
  output [31:0] io_ptw_pmp_2_mask,
  output        io_ptw_pmp_3_cfg_l,
  output [1:0]  io_ptw_pmp_3_cfg_a,
  output        io_ptw_pmp_3_cfg_x,
                io_ptw_pmp_3_cfg_w,
                io_ptw_pmp_3_cfg_r,
  output [29:0] io_ptw_pmp_3_addr,
  output [31:0] io_ptw_pmp_3_mask,
  output        io_ptw_pmp_4_cfg_l,
  output [1:0]  io_ptw_pmp_4_cfg_a,
  output        io_ptw_pmp_4_cfg_x,
                io_ptw_pmp_4_cfg_w,
                io_ptw_pmp_4_cfg_r,
  output [29:0] io_ptw_pmp_4_addr,
  output [31:0] io_ptw_pmp_4_mask,
  output        io_ptw_pmp_5_cfg_l,
  output [1:0]  io_ptw_pmp_5_cfg_a,
  output        io_ptw_pmp_5_cfg_x,
                io_ptw_pmp_5_cfg_w,
                io_ptw_pmp_5_cfg_r,
  output [29:0] io_ptw_pmp_5_addr,
  output [31:0] io_ptw_pmp_5_mask,
  output        io_ptw_pmp_6_cfg_l,
  output [1:0]  io_ptw_pmp_6_cfg_a,
  output        io_ptw_pmp_6_cfg_x,
                io_ptw_pmp_6_cfg_w,
                io_ptw_pmp_6_cfg_r,
  output [29:0] io_ptw_pmp_6_addr,
  output [31:0] io_ptw_pmp_6_mask,
  output        io_ptw_pmp_7_cfg_l,
  output [1:0]  io_ptw_pmp_7_cfg_a,
  output        io_ptw_pmp_7_cfg_x,
                io_ptw_pmp_7_cfg_w,
                io_ptw_pmp_7_cfg_r,
  output [29:0] io_ptw_pmp_7_addr,
  output [31:0] io_ptw_pmp_7_mask,
  output [63:0] io_ptw_customCSRs_csrs_0_value,
  output [31:0] io_fpu_inst,
  output [63:0] io_fpu_fromint_data,
  output [2:0]  io_fpu_fcsr_rm,
  output        io_fpu_dmem_resp_val,
  output [4:0]  io_fpu_dmem_resp_tag,
  output [31:0] io_fpu_dmem_resp_data,
  output        io_fpu_valid,
                io_fpu_killx,
                io_fpu_killm,
                io_wfi
);

  wire             _io_dmem_req_valid_output;	// @[RocketCore.scala:964:41]
  wire             _GEN;	// @[RocketCore.scala:742:21, :755:44, :756:23]
  wire             take_pc_wb;	// @[RocketCore.scala:733:53]
  wire             take_pc_mem;	// @[RocketCore.scala:599:49]
  wire             _div_io_req_ready;	// @[RocketCore.scala:481:19]
  wire             _div_io_resp_valid;	// @[RocketCore.scala:481:19]
  wire [63:0]      _div_io_resp_bits_data;	// @[RocketCore.scala:481:19]
  wire [4:0]       _div_io_resp_bits_tag;	// @[RocketCore.scala:481:19]
  wire [63:0]      _alu_io_out;	// @[RocketCore.scala:425:19]
  wire [63:0]      _alu_io_adder_out;	// @[RocketCore.scala:425:19]
  wire             _alu_io_cmp_out;	// @[RocketCore.scala:425:19]
  wire             _bpu_io_xcpt_if;	// @[RocketCore.scala:360:19]
  wire             _bpu_io_xcpt_ld;	// @[RocketCore.scala:360:19]
  wire             _bpu_io_xcpt_st;	// @[RocketCore.scala:360:19]
  wire             _bpu_io_debug_if;	// @[RocketCore.scala:360:19]
  wire             _bpu_io_debug_ld;	// @[RocketCore.scala:360:19]
  wire             _bpu_io_debug_st;	// @[RocketCore.scala:360:19]
  wire [63:0]      _csr_io_rw_rdata;	// @[RocketCore.scala:315:19]
  wire             _csr_io_decode_0_fp_illegal;	// @[RocketCore.scala:315:19]
  wire             _csr_io_decode_0_fp_csr;	// @[RocketCore.scala:315:19]
  wire             _csr_io_decode_0_read_illegal;	// @[RocketCore.scala:315:19]
  wire             _csr_io_decode_0_write_illegal;	// @[RocketCore.scala:315:19]
  wire             _csr_io_decode_0_write_flush;	// @[RocketCore.scala:315:19]
  wire             _csr_io_decode_0_system_illegal;	// @[RocketCore.scala:315:19]
  wire             _csr_io_csr_stall;	// @[RocketCore.scala:315:19]
  wire             _csr_io_eret;	// @[RocketCore.scala:315:19]
  wire             _csr_io_singleStep;	// @[RocketCore.scala:315:19]
  wire             _csr_io_status_debug;	// @[RocketCore.scala:315:19]
  wire [31:0]      _csr_io_status_isa;	// @[RocketCore.scala:315:19]
  wire [33:0]      _csr_io_evec;	// @[RocketCore.scala:315:19]
  wire [63:0]      _csr_io_time;	// @[RocketCore.scala:315:19]
  wire             _csr_io_interrupt;	// @[RocketCore.scala:315:19]
  wire [63:0]      _csr_io_interrupt_cause;	// @[RocketCore.scala:315:19]
  wire             _csr_io_bp_0_control_action;	// @[RocketCore.scala:315:19]
  wire             _csr_io_bp_0_control_chain;	// @[RocketCore.scala:315:19]
  wire [1:0]       _csr_io_bp_0_control_tmatch;	// @[RocketCore.scala:315:19]
  wire             _csr_io_bp_0_control_x;	// @[RocketCore.scala:315:19]
  wire             _csr_io_bp_0_control_w;	// @[RocketCore.scala:315:19]
  wire             _csr_io_bp_0_control_r;	// @[RocketCore.scala:315:19]
  wire [32:0]      _csr_io_bp_0_address;	// @[RocketCore.scala:315:19]
  wire             _csr_io_inhibit_cycle;	// @[RocketCore.scala:315:19]
  wire             _csr_io_trace_0_valid;	// @[RocketCore.scala:315:19]
  wire [33:0]      _csr_io_trace_0_iaddr;	// @[RocketCore.scala:315:19]
  wire [31:0]      _csr_io_trace_0_insn;	// @[RocketCore.scala:315:19]
  wire             _csr_io_trace_0_exception;	// @[RocketCore.scala:315:19]
  wire [63:0]      _csr_io_customCSRs_0_value;	// @[RocketCore.scala:315:19]
  wire [63:0]      _rf_ext_R0_data;	// @[RocketCore.scala:1145:15]
  wire [63:0]      _rf_ext_R1_data;	// @[RocketCore.scala:1145:15]
  wire [33:0]      _ibuf_io_pc;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_valid;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_xcpt0_pf_inst;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_xcpt0_gf_inst;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_xcpt0_ae_inst;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_xcpt1_pf_inst;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_xcpt1_gf_inst;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_xcpt1_ae_inst;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_replay;	// @[RocketCore.scala:286:20]
  wire             _ibuf_io_inst_0_bits_rvc;	// @[RocketCore.scala:286:20]
  wire [31:0]      _ibuf_io_inst_0_bits_inst_bits;	// @[RocketCore.scala:286:20]
  wire [4:0]       _ibuf_io_inst_0_bits_inst_rd;	// @[RocketCore.scala:286:20]
  wire [4:0]       _ibuf_io_inst_0_bits_inst_rs1;	// @[RocketCore.scala:286:20]
  wire [4:0]       _ibuf_io_inst_0_bits_inst_rs2;	// @[RocketCore.scala:286:20]
  wire [4:0]       _ibuf_io_inst_0_bits_inst_rs3;	// @[RocketCore.scala:286:20]
  wire [31:0]      _ibuf_io_inst_0_bits_raw;	// @[RocketCore.scala:286:20]
  reg              id_reg_pause;	// @[RocketCore.scala:129:25]
  reg              imem_might_request_reg;	// @[RocketCore.scala:130:35]
  reg              ex_ctrl_fp;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_rocc;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_branch;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_jal;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_jalr;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_rxs2;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_rxs1;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_zbk;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_zkn;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_zks;	// @[RocketCore.scala:217:20]
  reg  [1:0]       ex_ctrl_sel_alu2;	// @[RocketCore.scala:217:20]
  reg  [1:0]       ex_ctrl_sel_alu1;	// @[RocketCore.scala:217:20]
  reg  [2:0]       ex_ctrl_sel_imm;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_alu_dw;	// @[RocketCore.scala:217:20]
  reg  [3:0]       ex_ctrl_alu_fn;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_mem;	// @[RocketCore.scala:217:20]
  reg  [4:0]       ex_ctrl_mem_cmd;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_rfs1;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_rfs2;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_wfd;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_mul;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_div;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_wxd;	// @[RocketCore.scala:217:20]
  reg  [2:0]       ex_ctrl_csr;	// @[RocketCore.scala:217:20]
  reg              ex_ctrl_fence_i;	// @[RocketCore.scala:217:20]
  reg              mem_ctrl_fp;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_rocc;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_branch;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_jal;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_jalr;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_rxs2;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_rxs1;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_mem;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_rfs1;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_rfs2;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_wfd;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_mul;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_div;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_wxd;	// @[RocketCore.scala:218:21]
  reg  [2:0]       mem_ctrl_csr;	// @[RocketCore.scala:218:21]
  reg              mem_ctrl_fence_i;	// @[RocketCore.scala:218:21]
  reg              wb_ctrl_rocc;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_rxs2;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_rxs1;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_mem;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_rfs1;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_rfs2;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_wfd;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_div;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_wxd;	// @[RocketCore.scala:219:20]
  reg  [2:0]       wb_ctrl_csr;	// @[RocketCore.scala:219:20]
  reg              wb_ctrl_fence_i;	// @[RocketCore.scala:219:20]
  reg              ex_reg_xcpt_interrupt;	// @[RocketCore.scala:221:35]
  reg              ex_reg_valid;	// @[RocketCore.scala:222:35]
  reg              ex_reg_rvc;	// @[RocketCore.scala:223:35]
  reg              ex_reg_xcpt;	// @[RocketCore.scala:225:35]
  reg              ex_reg_flush_pipe;	// @[RocketCore.scala:226:35]
  reg              ex_reg_load_use;	// @[RocketCore.scala:227:35]
  reg  [63:0]      ex_reg_cause;	// @[RocketCore.scala:228:35]
  reg              ex_reg_replay;	// @[RocketCore.scala:229:26]
  reg  [33:0]      ex_reg_pc;	// @[RocketCore.scala:230:22]
  reg  [1:0]       ex_reg_mem_size;	// @[RocketCore.scala:231:28]
  reg              ex_reg_hls;	// @[RocketCore.scala:232:23]
  reg  [31:0]      ex_reg_inst;	// @[RocketCore.scala:233:24]
  reg  [31:0]      ex_reg_raw_inst;	// @[RocketCore.scala:234:28]
  reg              ex_scie_unpipelined;	// @[RocketCore.scala:235:32]
  reg              ex_scie_pipelined;	// @[RocketCore.scala:236:30]
  reg              mem_reg_xcpt_interrupt;	// @[RocketCore.scala:239:36]
  reg              mem_reg_valid;	// @[RocketCore.scala:240:36]
  reg              mem_reg_rvc;	// @[RocketCore.scala:241:36]
  reg              mem_reg_xcpt;	// @[RocketCore.scala:243:36]
  reg              mem_reg_replay;	// @[RocketCore.scala:244:36]
  reg              mem_reg_flush_pipe;	// @[RocketCore.scala:245:36]
  reg  [63:0]      mem_reg_cause;	// @[RocketCore.scala:246:36]
  reg              mem_reg_slow_bypass;	// @[RocketCore.scala:247:36]
  reg              mem_reg_load;	// @[RocketCore.scala:248:36]
  reg              mem_reg_store;	// @[RocketCore.scala:249:36]
  reg              mem_reg_sfence;	// @[RocketCore.scala:250:27]
  reg  [33:0]      mem_reg_pc;	// @[RocketCore.scala:251:23]
  reg  [31:0]      mem_reg_inst;	// @[RocketCore.scala:252:25]
  reg              mem_reg_hls_or_dv;	// @[RocketCore.scala:254:30]
  reg  [31:0]      mem_reg_raw_inst;	// @[RocketCore.scala:255:29]
  reg              mem_scie_pipelined;	// @[RocketCore.scala:257:31]
  reg  [63:0]      mem_reg_wdata;	// @[RocketCore.scala:258:26]
  reg  [63:0]      mem_reg_rs2;	// @[RocketCore.scala:259:24]
  reg              mem_br_taken;	// @[RocketCore.scala:260:25]
  reg              wb_reg_valid;	// @[RocketCore.scala:264:35]
  reg              wb_reg_xcpt;	// @[RocketCore.scala:265:35]
  reg              wb_reg_replay;	// @[RocketCore.scala:266:35]
  reg              wb_reg_flush_pipe;	// @[RocketCore.scala:267:35]
  reg  [63:0]      wb_reg_cause;	// @[RocketCore.scala:268:35]
  reg              wb_reg_sfence;	// @[RocketCore.scala:269:26]
  reg  [33:0]      wb_reg_pc;	// @[RocketCore.scala:270:22]
  reg              wb_reg_hls_or_dv;	// @[RocketCore.scala:272:29]
  reg  [31:0]      wb_reg_inst;	// @[RocketCore.scala:275:24]
  reg  [31:0]      wb_reg_raw_inst;	// @[RocketCore.scala:276:28]
  reg  [63:0]      wb_reg_wdata;	// @[RocketCore.scala:277:25]
  wire             take_pc_mem_wb = take_pc_wb | take_pc_mem;	// @[RocketCore.scala:282:35, :599:49, :733:53]
  wire [29:0]      _GEN_0 = ~(_ibuf_io_inst_0_bits_inst_bits[31:2]);	// @[RocketCore.scala:286:20, pla.scala:78:21]
  wire [6:0]       _id_ctrl_decoder_decoded_T = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[3], _GEN_0[4], _GEN_0[10]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_4 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _GEN_0[3], _GEN_0[4], _GEN_0[11]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [6:0]       _id_ctrl_decoder_decoded_T_6 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _GEN_0[4], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_8 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _GEN_0[3], _GEN_0[4], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]       _id_ctrl_decoder_decoded_T_12 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _GEN_0[10], _GEN_0[11], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [5:0]       _id_ctrl_decoder_decoded_T_14 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_18 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_22 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [12:0]      _id_ctrl_decoder_decoded_T_26 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_28 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [4:0]       _id_ctrl_decoder_decoded_T_32 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[2], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [11:0]      _id_ctrl_decoder_decoded_T_36 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[23], _GEN_0[24], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]       _id_ctrl_decoder_decoded_T_42 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[11], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [9:0]       _id_ctrl_decoder_decoded_T_44 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[11], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [6:0]       _id_ctrl_decoder_decoded_T_46 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [9:0]       _id_ctrl_decoder_decoded_T_52 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [13:0]      _id_ctrl_decoder_decoded_T_54 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_58 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[3], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]       _id_ctrl_decoder_decoded_T_66 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_68 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_70 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[1], _GEN_0[2], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_78 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [10:0]      _id_ctrl_decoder_decoded_T_86 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _GEN_0[25], _GEN_0[26]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_92 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[13]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]       _id_ctrl_decoder_decoded_T_94 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_104 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[14]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_106 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_110 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[3], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_116 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [13:0]      _id_ctrl_decoder_decoded_T_148 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[14], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [12:0]      _id_ctrl_decoder_decoded_T_154 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _ibuf_io_inst_0_bits_inst_bits[27], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [16:0]      _id_ctrl_decoder_decoded_T_156 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[18], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [18:0]      _id_ctrl_decoder_decoded_T_158 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _GEN_0[18], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_166 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_168 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_170 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [18:0]      _id_ctrl_decoder_decoded_T_190 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[18], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _ibuf_io_inst_0_bits_inst_bits[27], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [15:0]      _id_ctrl_decoder_decoded_T_202 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _ibuf_io_inst_0_bits_inst_bits[31]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [16:0]      _id_ctrl_decoder_decoded_T_204 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _ibuf_io_inst_0_bits_inst_bits[31]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [16:0]      _id_ctrl_decoder_decoded_T_206 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _ibuf_io_inst_0_bits_inst_bits[31]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [20:0]      _id_ctrl_decoder_decoded_T_208 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[18], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[29], _ibuf_io_inst_0_bits_inst_bits[30], _ibuf_io_inst_0_bits_inst_bits[31]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [20:0]      _id_ctrl_decoder_decoded_T_210 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[11], _GEN_0[12], _GEN_0[18], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _ibuf_io_inst_0_bits_inst_bits[30], _ibuf_io_inst_0_bits_inst_bits[31]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [21:0]      _id_ctrl_decoder_decoded_T_212 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[18], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _ibuf_io_inst_0_bits_inst_bits[29], _ibuf_io_inst_0_bits_inst_bits[30], _ibuf_io_inst_0_bits_inst_bits[31]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [2:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T = {&_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156};	// @[Cat.scala:33:92, pla.scala:98:74]
  wire [25:0]      _id_ctrl_decoder_decoded_orMatrixOutputs_T_8 = {&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_8, &_id_ctrl_decoder_decoded_T_12, &_id_ctrl_decoder_decoded_T_14, &_id_ctrl_decoder_decoded_T_22, &_id_ctrl_decoder_decoded_T_26, &_id_ctrl_decoder_decoded_T_28, &_id_ctrl_decoder_decoded_T_44, &_id_ctrl_decoder_decoded_T_46, &_id_ctrl_decoder_decoded_T_54, &_id_ctrl_decoder_decoded_T_58, &_id_ctrl_decoder_decoded_T_68, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_92, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_110, &_id_ctrl_decoder_decoded_T_116, &_id_ctrl_decoder_decoded_T_148, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28], _ibuf_io_inst_0_bits_inst_bits[31]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28], _ibuf_io_inst_0_bits_inst_bits[31]}, &_id_ctrl_decoder_decoded_T_204, &_id_ctrl_decoder_decoded_T_210};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [2:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T_10 = {&{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_148};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [6:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T_26 = {&{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _GEN_0[3], _GEN_0[4], _GEN_0[10]}, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_6, &_id_ctrl_decoder_decoded_T_70, &_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_158};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [23:0]      _id_ctrl_decoder_decoded_orMatrixOutputs_T_52 = {&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_6, &_id_ctrl_decoder_decoded_T_12, &_id_ctrl_decoder_decoded_T_22, &_id_ctrl_decoder_decoded_T_26, &_id_ctrl_decoder_decoded_T_28, &_id_ctrl_decoder_decoded_T_42, &_id_ctrl_decoder_decoded_T_54, &_id_ctrl_decoder_decoded_T_58, &_id_ctrl_decoder_decoded_T_66, &_id_ctrl_decoder_decoded_T_70, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_94, &_id_ctrl_decoder_decoded_T_104, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_110, &_id_ctrl_decoder_decoded_T_116, &_id_ctrl_decoder_decoded_T_148, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156, &_id_ctrl_decoder_decoded_T_206, &_id_ctrl_decoder_decoded_T_212};	// @[Cat.scala:33:92, pla.scala:98:74]
  wire [11:0]      _id_ctrl_decoder_decoded_orMatrixOutputs_T_54 = {&_id_ctrl_decoder_decoded_T_18, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[11], _GEN_0[12]}, &_id_ctrl_decoder_decoded_T_22, &_id_ctrl_decoder_decoded_T_26, &_id_ctrl_decoder_decoded_T_28, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_104, &_id_ctrl_decoder_decoded_T_116, &_id_ctrl_decoder_decoded_T_148, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [9:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T_60 = {&_id_ctrl_decoder_decoded_T_32, &_id_ctrl_decoder_decoded_T_36, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _GEN_0[1], _GEN_0[2], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]}, &_id_ctrl_decoder_decoded_T_166, &_id_ctrl_decoder_decoded_T_168, &_id_ctrl_decoder_decoded_T_170, &_id_ctrl_decoder_decoded_T_190, &_id_ctrl_decoder_decoded_T_202, &_id_ctrl_decoder_decoded_T_208, &_id_ctrl_decoder_decoded_T_210};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [2:0]       id_ctrl_csr =
    {|{&{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_68, &_id_ctrl_decoder_decoded_T_92, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _ibuf_io_inst_0_bits_inst_bits[20], _GEN_0[19], _ibuf_io_inst_0_bits_inst_bits[22], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _GEN_0[18], _ibuf_io_inst_0_bits_inst_bits[21], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _GEN_0[18], _ibuf_io_inst_0_bits_inst_bits[21], _GEN_0[20], _GEN_0[21], _ibuf_io_inst_0_bits_inst_bits[24], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _ibuf_io_inst_0_bits_inst_bits[27], _ibuf_io_inst_0_bits_inst_bits[28], _ibuf_io_inst_0_bits_inst_bits[29], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]}},
     &_id_ctrl_decoder_decoded_T_92,
     &_id_ctrl_decoder_decoded_T_68};	// @[Cat.scala:33:92, Decode.scala:50:77, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  reg              id_reg_fence;	// @[RocketCore.scala:307:29]
  wire             _id_csr_ren_T = id_ctrl_csr == 3'h6;	// @[Decode.scala:50:77, package.scala:16:47]
  wire             id_csr_en = _id_csr_ren_T | (&id_ctrl_csr) | id_ctrl_csr == 3'h5;	// @[Decode.scala:50:77, RocketCore.scala:1167:24, package.scala:16:47, :73:59]
  wire             id_mem_busy = ~io_dmem_ordered | _io_dmem_req_valid_output;	// @[RocketCore.scala:352:{21,38}, :964:41]
  wire             _io_rocc_cmd_valid_T = wb_reg_valid & wb_ctrl_rocc;	// @[RocketCore.scala:219:20, :264:35, :356:53]
  wire             _dcache_kill_mem_T = mem_reg_valid & mem_ctrl_wxd;	// @[RocketCore.scala:218:21, :240:36, :405:20]
  wire             _fp_data_hazard_ex_T_1 = ex_reg_inst[11:7] == _ibuf_io_inst_0_bits_inst_rs1;	// @[RocketCore.scala:233:24, :286:20, :399:29, :407:82]
  wire             _fp_data_hazard_mem_T_1 = mem_reg_inst[11:7] == _ibuf_io_inst_0_bits_inst_rs1;	// @[RocketCore.scala:252:25, :286:20, :400:31, :407:82]
  wire             _fp_data_hazard_ex_T_3 = ex_reg_inst[11:7] == _ibuf_io_inst_0_bits_inst_rs2;	// @[RocketCore.scala:233:24, :286:20, :399:29, :407:82]
  wire             _fp_data_hazard_mem_T_3 = mem_reg_inst[11:7] == _ibuf_io_inst_0_bits_inst_rs2;	// @[RocketCore.scala:252:25, :286:20, :400:31, :407:82]
  reg              ex_reg_rs_bypass_0;	// @[RocketCore.scala:411:29]
  reg              ex_reg_rs_bypass_1;	// @[RocketCore.scala:411:29]
  reg  [1:0]       ex_reg_rs_lsb_0;	// @[RocketCore.scala:412:26]
  reg  [1:0]       ex_reg_rs_lsb_1;	// @[RocketCore.scala:412:26]
  reg  [61:0]      ex_reg_rs_msb_0;	// @[RocketCore.scala:413:26]
  reg  [61:0]      ex_reg_rs_msb_1;	// @[RocketCore.scala:413:26]
  wire [3:0][63:0] _GEN_1 = {{io_dmem_resp_bits_data_word_bypass}, {wb_reg_wdata}, {mem_reg_wdata}, {64'h0}};	// @[RocketCore.scala:258:26, :277:25, package.scala:33:{76,86}]
  wire [63:0]      _ex_rs_T_5 = _GEN_1[ex_reg_rs_lsb_0];	// @[RocketCore.scala:412:26, package.scala:33:{76,86}]
  wire [63:0]      _ex_rs_T_6 = {ex_reg_rs_msb_0, ex_reg_rs_lsb_0};	// @[Cat.scala:33:92, RocketCore.scala:412:26, :413:26]
  wire [63:0]      ex_rs_0 = ex_reg_rs_bypass_0 ? _ex_rs_T_5 : _ex_rs_T_6;	// @[Cat.scala:33:92, RocketCore.scala:411:29, :415:14, package.scala:33:76]
  wire [63:0]      _ex_rs_T_12 = _GEN_1[ex_reg_rs_lsb_1];	// @[RocketCore.scala:412:26, package.scala:33:{76,86}]
  wire [63:0]      _ex_rs_T_13 = {ex_reg_rs_msb_1, ex_reg_rs_lsb_1};	// @[Cat.scala:33:92, RocketCore.scala:412:26, :413:26]
  wire [63:0]      ex_rs_1 = ex_reg_rs_bypass_1 ? _ex_rs_T_12 : _ex_rs_T_13;	// @[Cat.scala:33:92, RocketCore.scala:411:29, :415:14, package.scala:33:76]
  wire             _ex_imm_b0_T_4 = ex_ctrl_sel_imm == 3'h5;	// @[RocketCore.scala:217:20, :1167:24]
  wire             ex_imm_sign = ~_ex_imm_b0_T_4 & ex_reg_inst[31];	// @[RocketCore.scala:233:24, :1167:{19,24,44}]
  wire             _ex_imm_b4_1_T = ex_ctrl_sel_imm == 3'h2;	// @[RocketCore.scala:217:20, :1168:26]
  wire             _ex_imm_b4_1_T_2 = ex_ctrl_sel_imm == 3'h1;	// @[RocketCore.scala:217:20, :1172:23]
  wire             _ex_imm_b0_T = ex_ctrl_sel_imm == 3'h0;	// @[RocketCore.scala:217:20, :1175:24]
  wire [3:0][63:0] _GEN_2 = {{{{33{ex_imm_sign}}, _ex_imm_b4_1_T ? ex_reg_inst[30:20] : {11{ex_imm_sign}}, ex_ctrl_sel_imm != 3'h2 & ex_ctrl_sel_imm != 3'h3 ? {8{ex_imm_sign}} : ex_reg_inst[19:12], ~(_ex_imm_b4_1_T | _ex_imm_b0_T_4) & (ex_ctrl_sel_imm == 3'h3 ? ex_reg_inst[20] : _ex_imm_b4_1_T_2 ? ex_reg_inst[7] : ex_imm_sign), _ex_imm_b4_1_T | _ex_imm_b0_T_4 ? 6'h0 : ex_reg_inst[30:25], _ex_imm_b4_1_T ? 4'h0 : _ex_imm_b0_T | _ex_imm_b4_1_T_2 ? ex_reg_inst[11:8] : _ex_imm_b0_T_4 ? ex_reg_inst[19:16] : ex_reg_inst[24:21], _ex_imm_b0_T ? ex_reg_inst[7] : ex_ctrl_sel_imm == 3'h4 ? ex_reg_inst[20] : _ex_imm_b0_T_4 & ex_reg_inst[15]}}, {ex_rs_1}, {{60'h0, ex_reg_rvc ? 4'h2 : 4'h4}}, {64'h0}};	// @[Mux.scala:47:70, :81:{58,61}, RocketCore.scala:217:20, :223:35, :233:24, :415:14, :423:19, :1167:{19,24}, :1168:{21,26,41}, :1169:{21,26,36,43,65}, :1170:{18,33}, :1171:{18,23,39}, :1172:{18,23,39}, :1173:{20,35,62}, :1174:19, :1175:{19,24,34,57}, :1176:{19,39,52}, :1177:17, :1178:{17,22}, :1179:{17,37}]
  wire             _div_io_req_valid_T = ex_reg_valid & ex_ctrl_div;	// @[RocketCore.scala:217:20, :222:35, :482:36]
  wire             ex_pc_valid = ex_reg_valid | ex_reg_replay | ex_reg_xcpt_interrupt;	// @[RocketCore.scala:221:35, :222:35, :229:26, :566:51]
  wire             wb_dcache_miss = wb_ctrl_mem & ~io_dmem_resp_valid;	// @[RocketCore.scala:219:20, :567:{36,39}]
  wire             replay_ex = ex_reg_replay | ex_reg_valid & (ex_ctrl_mem & ~io_dmem_req_ready | ex_ctrl_div & ~_div_io_req_ready | wb_dcache_miss & ex_reg_load_use);	// @[RocketCore.scala:217:20, :222:35, :227:35, :229:26, :481:19, :567:36, :568:{42,45}, :569:{42,45}, :570:43, :571:{33,50,75}]
  wire             ctrl_killx = take_pc_mem_wb | replay_ex | ~ex_reg_valid;	// @[RocketCore.scala:222:35, :282:35, :571:33, :572:{48,51}]
  wire             _mem_cfi_taken_T = mem_ctrl_branch & mem_br_taken;	// @[RocketCore.scala:218:21, :260:25, :586:25]
  wire [31:0]      _mem_br_target_T_8 = _mem_cfi_taken_T ? {{20{mem_reg_inst[31]}}, mem_reg_inst[7], mem_reg_inst[30:25], mem_reg_inst[11:8], 1'h0} : mem_ctrl_jal ? {{12{mem_reg_inst[31]}}, mem_reg_inst[19:12], mem_reg_inst[20], mem_reg_inst[30:21], 1'h0} : {28'h0, mem_reg_rvc ? 4'h2 : 4'h4};	// @[Cat.scala:33:92, RocketCore.scala:218:21, :241:36, :252:25, :423:19, :586:{8,25}, :587:8, :588:8, :1167:44, :1169:65, :1171:39, :1172:39, :1173:62, :1175:57]
  wire [33:0]      _mem_br_target_T_10 = mem_reg_pc + {{2{_mem_br_target_T_8[31]}}, _mem_br_target_T_8};	// @[RocketCore.scala:251:23, :585:41, :586:8]
  wire [33:0]      _mem_npc_T_4 = mem_ctrl_jalr | mem_reg_sfence ? {mem_reg_wdata[63:33] == 31'h0 | (&(mem_reg_wdata[63:33])) ? mem_reg_wdata[33] : ~(mem_reg_wdata[32]), mem_reg_wdata[32:0]} : _mem_br_target_T_10;	// @[Cat.scala:33:92, RocketCore.scala:218:21, :250:27, :258:26, :585:41, :589:{21,36}, :1119:17, :1120:{18,21,29,34,46,51,54}, :1121:16]
  wire [33:0]      _mem_npc_T_5 = _mem_npc_T_4 & 34'h3FFFFFFFE;	// @[RocketCore.scala:589:{21,129}]
  wire             mem_cfi_taken = _mem_cfi_taken_T | mem_ctrl_jalr | mem_ctrl_jal;	// @[RocketCore.scala:218:21, :586:25, :596:74]
  assign take_pc_mem = mem_reg_valid & ~mem_reg_xcpt & (mem_cfi_taken | mem_reg_sfence);	// @[RocketCore.scala:240:36, :243:36, :250:27, :594:27, :596:74, :599:{49,71}]
  wire             mem_debug_breakpoint = mem_reg_load & _bpu_io_debug_ld | mem_reg_store & _bpu_io_debug_st;	// @[RocketCore.scala:248:36, :249:36, :360:19, :652:{44,64,82}]
  wire             mem_ldst_xcpt = mem_debug_breakpoint | mem_reg_load & _bpu_io_xcpt_ld | mem_reg_store & _bpu_io_xcpt_st;	// @[RocketCore.scala:248:36, :249:36, :360:19, :651:{38,75}, :652:64, :1104:26]
  wire             dcache_kill_mem = _dcache_kill_mem_T & io_dmem_replay_next;	// @[RocketCore.scala:405:20, :669:55]
  wire             fpu_kill_mem = mem_reg_valid & mem_ctrl_fp & io_fpu_nack_mem;	// @[RocketCore.scala:218:21, :240:36, :670:51]
  wire             killm_common = dcache_kill_mem | take_pc_wb | mem_reg_xcpt | ~mem_reg_valid;	// @[RocketCore.scala:240:36, :243:36, :669:55, :672:{68,71}, :733:53]
  reg              div_io_kill_REG;	// @[RocketCore.scala:673:41]
  wire             _T_104 = wb_reg_valid & wb_ctrl_mem;	// @[RocketCore.scala:219:20, :264:35, :703:19]
  wire             _T_91 = _T_104 & io_dmem_s2_xcpt_pf_st;	// @[RocketCore.scala:703:{19,34}]
  wire             _T_93 = _T_104 & io_dmem_s2_xcpt_pf_ld;	// @[RocketCore.scala:703:19, :704:34]
  wire             _T_95 = _T_104 & io_dmem_s2_xcpt_gf_st;	// @[RocketCore.scala:703:19, :705:34]
  wire             _T_97 = _T_104 & io_dmem_s2_xcpt_gf_ld;	// @[RocketCore.scala:703:19, :706:34]
  wire             _T_99 = _T_104 & io_dmem_s2_xcpt_ae_st;	// @[RocketCore.scala:703:19, :707:34]
  wire             _T_101 = _T_104 & io_dmem_s2_xcpt_ae_ld;	// @[RocketCore.scala:703:19, :708:34]
  wire             _T_103 = _T_104 & io_dmem_s2_xcpt_ma_st;	// @[RocketCore.scala:703:19, :709:34]
  wire             wb_xcpt = wb_reg_xcpt | _T_91 | _T_93 | _T_95 | _T_97 | _T_99 | _T_101 | _T_103 | _T_104 & io_dmem_s2_xcpt_ma_ld;	// @[RocketCore.scala:265:35, :703:{19,34}, :704:34, :705:34, :706:34, :707:34, :708:34, :709:34, :710:34, :1104:26]
  wire             wb_wxd = wb_reg_valid & wb_ctrl_wxd;	// @[RocketCore.scala:219:20, :264:35, :728:29]
  wire             wb_set_sboard = wb_ctrl_div | wb_dcache_miss | wb_ctrl_rocc;	// @[RocketCore.scala:219:20, :567:36, :729:53]
  wire             replay_wb_common = io_dmem_s2_nack | wb_reg_replay;	// @[RocketCore.scala:266:35, :730:42]
  wire             replay_wb = replay_wb_common | _io_rocc_cmd_valid_T;	// @[RocketCore.scala:356:53, :730:42, :732:36]
  assign take_pc_wb = replay_wb | wb_xcpt | _csr_io_eret | wb_reg_flush_pipe;	// @[RocketCore.scala:267:35, :315:19, :732:36, :733:53, :1104:26]
  wire             dmem_resp_valid = io_dmem_resp_valid & io_dmem_resp_bits_has_data;	// @[RocketCore.scala:739:44]
  wire             dmem_resp_replay = dmem_resp_valid & io_dmem_resp_bits_replay;	// @[RocketCore.scala:739:44, :740:42]
  wire             _T_128 = dmem_resp_replay & ~(io_dmem_resp_bits_tag[0]);	// @[RocketCore.scala:736:{23,45}, :740:42, :755:26]
  assign _GEN = ~_T_128 & ~wb_wxd;	// @[RocketCore.scala:728:29, :742:{21,24}, :755:{26,44}, :756:23]
  wire [4:0]       ll_waddr = _T_128 ? io_dmem_resp_bits_tag[5:1] : _div_io_resp_bits_tag;	// @[RocketCore.scala:481:19, :738:46, :744:29, :755:{26,44}, :759:14]
  wire             ll_wen = _T_128 | _GEN & _div_io_resp_valid;	// @[Decoupled.scala:51:35, RocketCore.scala:481:19, :742:21, :745:27, :755:{26,44}, :756:23, :760:12]
  wire             wb_valid = wb_reg_valid & ~replay_wb & ~wb_xcpt;	// @[RocketCore.scala:264:35, :732:36, :763:{34,45,48}, :1104:26]
  wire             wb_wen = wb_valid & wb_ctrl_wxd;	// @[RocketCore.scala:219:20, :763:45, :764:25]
  wire             rf_wen = wb_wen | ll_wen;	// @[RocketCore.scala:745:27, :755:44, :760:12, :764:25, :765:23]
  wire [4:0]       rf_waddr = ll_wen ? ll_waddr : wb_reg_inst[11:7];	// @[RocketCore.scala:275:24, :401:29, :744:29, :745:27, :755:44, :759:14, :760:12, :766:21]
  wire [63:0]      coreMonitorBundle_wrdata = dmem_resp_valid & ~(io_dmem_resp_bits_tag[0]) ? io_dmem_resp_bits_data : ll_wen ? _div_io_resp_bits_data : (|wb_ctrl_csr) ? _csr_io_rw_rdata : wb_reg_wdata;	// @[RocketCore.scala:219:20, :277:25, :315:19, :481:19, :736:{23,45}, :739:44, :745:27, :755:44, :760:12, :767:{21,38}, :768:21, :769:{21,34}]
  wire [63:0]      id_rs_0 = rf_wen & (|rf_waddr) & rf_waddr == _ibuf_io_inst_0_bits_inst_rs1 ? coreMonitorBundle_wrdata : _rf_ext_R0_data;	// @[RocketCore.scala:286:20, :765:23, :766:21, :767:21, :772:17, :1145:15, :1152:19, :1157:{16,25}, :1160:{20,31,39}]
  wire [63:0]      id_rs_1 = rf_wen & (|rf_waddr) & rf_waddr == _ibuf_io_inst_0_bits_inst_rs2 ? coreMonitorBundle_wrdata : _rf_ext_R1_data;	// @[RocketCore.scala:286:20, :765:23, :766:21, :767:21, :772:17, :1145:15, :1152:19, :1157:{16,25}, :1160:{20,31,39}]
  wire             _csr_io_htval_htval_valid_imem_T = wb_reg_cause == 64'h14;	// @[RocketCore.scala:268:35, package.scala:16:47]
  wire             _T_135 = (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_52) & (|_ibuf_io_inst_0_bits_inst_rs1);	// @[Cat.scala:33:92, RocketCore.scala:286:20, :839:{42,55}, pla.scala:114:39]
  wire             _T_137 = (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_54) & (|_ibuf_io_inst_0_bits_inst_rs2);	// @[Cat.scala:33:92, RocketCore.scala:286:20, :840:{42,55}, pla.scala:114:39]
  wire             _T_139 = (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_8) & (|_ibuf_io_inst_0_bits_inst_rd);	// @[Cat.scala:33:92, RocketCore.scala:286:20, :841:{42,55}, pla.scala:114:39]
  reg  [31:0]      _r;	// @[RocketCore.scala:1131:29]
  wire [31:0]      r = {_r[31:1], 1'h0};	// @[RocketCore.scala:1131:29, :1132:{35,40}]
  wire [31:0]      _GEN_3 = {27'h0, _ibuf_io_inst_0_bits_inst_rs1};	// @[RocketCore.scala:286:20, :1128:35, :1135:58]
  wire [31:0]      _id_sboard_hazard_T = r >> _GEN_3;	// @[RocketCore.scala:1128:35, :1132:40]
  wire [31:0]      _GEN_4 = {27'h0, _ibuf_io_inst_0_bits_inst_rs2};	// @[RocketCore.scala:286:20, :1128:35, :1135:58]
  wire [31:0]      _id_sboard_hazard_T_7 = r >> _GEN_4;	// @[RocketCore.scala:1128:35, :1132:40]
  wire [31:0]      _GEN_5 = {27'h0, _ibuf_io_inst_0_bits_inst_rd};	// @[RocketCore.scala:286:20, :1128:35, :1135:58]
  wire [31:0]      _id_sboard_hazard_T_14 = r >> _GEN_5;	// @[RocketCore.scala:1128:35, :1132:40]
  wire             _fp_data_hazard_ex_T_7 = _ibuf_io_inst_0_bits_inst_rd == ex_reg_inst[11:7];	// @[RocketCore.scala:233:24, :286:20, :399:29, :859:70]
  wire             _fp_data_hazard_mem_T_7 = _ibuf_io_inst_0_bits_inst_rd == mem_reg_inst[11:7];	// @[RocketCore.scala:252:25, :286:20, :400:31, :868:72]
  wire             data_hazard_mem = mem_ctrl_wxd & (_T_135 & _fp_data_hazard_mem_T_1 | _T_137 & _fp_data_hazard_mem_T_3 | _T_139 & _fp_data_hazard_mem_T_7);	// @[RocketCore.scala:218:21, :407:82, :839:42, :840:42, :841:42, :868:{38,72}, :1113:{27,50}]
  wire             _fp_data_hazard_wb_T_1 = _ibuf_io_inst_0_bits_inst_rs1 == wb_reg_inst[11:7];	// @[RocketCore.scala:275:24, :286:20, :401:29, :874:70]
  wire             _fp_data_hazard_wb_T_3 = _ibuf_io_inst_0_bits_inst_rs2 == wb_reg_inst[11:7];	// @[RocketCore.scala:275:24, :286:20, :401:29, :874:70]
  wire             _fp_data_hazard_wb_T_7 = _ibuf_io_inst_0_bits_inst_rd == wb_reg_inst[11:7];	// @[RocketCore.scala:275:24, :286:20, :401:29, :874:70]
  reg  [31:0]      _id_stall_fpu_r;	// @[RocketCore.scala:1131:29]
  wire [31:0]      _id_stall_fpu_T_18 = _id_stall_fpu_r >> _GEN_3;	// @[RocketCore.scala:1128:35, :1131:29]
  wire [31:0]      _id_stall_fpu_T_21 = _id_stall_fpu_r >> _GEN_4;	// @[RocketCore.scala:1128:35, :1131:29]
  wire [31:0]      _id_stall_fpu_T_24 = _id_stall_fpu_r >> _ibuf_io_inst_0_bits_inst_rs3;	// @[RocketCore.scala:286:20, :1128:35, :1131:29]
  wire [31:0]      _id_stall_fpu_T_27 = _id_stall_fpu_r >> _GEN_5;	// @[RocketCore.scala:1128:35, :1131:29]
  reg              dcache_blocked_blocked;	// @[RocketCore.scala:889:22]
  reg              rocc_blocked;	// @[RocketCore.scala:893:25]
  wire             _ctrl_stalld_T_28 =
    ex_reg_valid & (ex_ctrl_wxd & (_T_135 & _fp_data_hazard_ex_T_1 | _T_137 & _fp_data_hazard_ex_T_3 | _T_139 & _fp_data_hazard_ex_T_7) & ((|ex_ctrl_csr) | ex_ctrl_jalr | ex_ctrl_mem | ex_ctrl_mul | ex_ctrl_div | ex_ctrl_fp | ex_ctrl_rocc | ex_scie_pipelined) | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_60) & ex_ctrl_wfd & (io_fpu_dec_ren1 & _fp_data_hazard_ex_T_1 | io_fpu_dec_ren2 & _fp_data_hazard_ex_T_3 | io_fpu_dec_ren3 & _ibuf_io_inst_0_bits_inst_rs3 == ex_reg_inst[11:7] | io_fpu_dec_wen & _fp_data_hazard_ex_T_7)) | mem_reg_valid & (data_hazard_mem & ((|mem_ctrl_csr) | mem_ctrl_mem & mem_reg_slow_bypass | mem_ctrl_mul | mem_ctrl_div | mem_ctrl_fp | mem_ctrl_rocc) | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_60) & mem_ctrl_wfd & (io_fpu_dec_ren1 & _fp_data_hazard_mem_T_1 | io_fpu_dec_ren2 & _fp_data_hazard_mem_T_3 | io_fpu_dec_ren3 & _ibuf_io_inst_0_bits_inst_rs3 == mem_reg_inst[11:7] | io_fpu_dec_wen & _fp_data_hazard_mem_T_7)) | wb_reg_valid & (wb_ctrl_wxd & (_T_135 & _fp_data_hazard_wb_T_1 | _T_137 & _fp_data_hazard_wb_T_3 | _T_139 & _fp_data_hazard_wb_T_7) & wb_set_sboard | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_60) & wb_ctrl_wfd & (io_fpu_dec_ren1 & _fp_data_hazard_wb_T_1 | io_fpu_dec_ren2 & _fp_data_hazard_wb_T_3 | io_fpu_dec_ren3 & _ibuf_io_inst_0_bits_inst_rs3 == wb_reg_inst[11:7] | io_fpu_dec_wen & _fp_data_hazard_wb_T_7)) | _T_135 & _id_sboard_hazard_T[0] & ~(ll_wen & ll_waddr == _ibuf_io_inst_0_bits_inst_rs1) | _T_137 & _id_sboard_hazard_T_7[0] & ~(ll_wen & ll_waddr == _ibuf_io_inst_0_bits_inst_rs2) | _T_139 & _id_sboard_hazard_T_14[0] & ~(ll_wen & ll_waddr == _ibuf_io_inst_0_bits_inst_rd) | _csr_io_singleStep & (ex_reg_valid | mem_reg_valid | wb_reg_valid) | id_csr_en & _csr_io_decode_0_fp_csr & ~io_fpu_fcsr_rdy | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_60) & (io_fpu_dec_ren1 & _id_stall_fpu_T_18[0] | io_fpu_dec_ren2 & _id_stall_fpu_T_21[0] | io_fpu_dec_ren3 & _id_stall_fpu_T_24[0] | io_fpu_dec_wen & _id_stall_fpu_T_27[0]) | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_26)
    & dcache_blocked_blocked & ~io_dmem_perf_grant | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_10) & (~(_div_io_req_ready | _div_io_resp_valid & ~wb_wxd) | _div_io_req_valid_T) | id_mem_busy & ((|_id_ctrl_decoder_decoded_orMatrixOutputs_T) & _ibuf_io_inst_0_bits_inst_bits[25] | (&_id_ctrl_decoder_decoded_T_52) | id_reg_fence & (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_26)) | _csr_io_csr_stall | id_reg_pause;	// @[Cat.scala:33:92, RocketCore.scala:129:25, :217:20, :218:21, :219:20, :222:35, :233:24, :236:30, :240:36, :247:36, :252:25, :264:35, :275:24, :286:20, :307:29, :315:19, :348:29, :352:38, :358:{17,33,65,81}, :399:29, :400:31, :401:29, :407:82, :481:19, :482:36, :728:29, :729:53, :742:24, :744:29, :745:27, :755:44, :759:14, :760:12, :839:42, :840:42, :841:42, :851:{58,70}, :854:80, :858:{38,139}, :859:70, :860:{53,90}, :861:{35,54,74}, :867:{40,66,131}, :868:{38,72}, :869:{55,92}, :870:{37,57,78}, :874:70, :875:{53,90}, :876:{35,54,71}, :889:22, :890:63, :898:{23,57}, :899:{42,45}, :900:16, :901:17, :903:{17,21,40,62,75}, :906:22, :1113:{27,50}, :1128:35, package.scala:73:59, pla.scala:98:74, :114:39]
  wire             ctrl_killd = ~_ibuf_io_inst_0_valid | _ibuf_io_inst_0_bits_replay | take_pc_mem_wb | _ctrl_stalld_T_28 | _csr_io_interrupt;	// @[RocketCore.scala:282:35, :286:20, :315:19, :906:22, :909:{17,104}]
  assign _io_dmem_req_valid_output = ex_reg_valid & ex_ctrl_mem;	// @[RocketCore.scala:217:20, :222:35, :964:41]
  reg  [63:0]      coreMonitorBundle_rd0val_REG;	// @[RocketCore.scala:1025:46]
  reg  [63:0]      coreMonitorBundle_rd0val_REG_1;	// @[RocketCore.scala:1025:38]
  reg  [63:0]      coreMonitorBundle_rd1val_REG;	// @[RocketCore.scala:1027:46]
  reg  [63:0]      coreMonitorBundle_rd1val_REG_1;	// @[RocketCore.scala:1027:38]
  wire             _T_39 = _bpu_io_xcpt_if | (|{_ibuf_io_inst_0_bits_xcpt0_pf_inst, _ibuf_io_inst_0_bits_xcpt0_gf_inst, _ibuf_io_inst_0_bits_xcpt0_ae_inst});	// @[RocketCore.scala:286:20, :360:19, :518:{28,40,47}]
  wire [15:0]      _id_ctrl_decoder_decoded_T_180 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [15:0]      _id_ctrl_decoder_decoded_T_184 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [15:0]      _id_ctrl_decoder_decoded_T_186 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[3], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [15:0]      _id_ctrl_decoder_decoded_T_188 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [3:0]       id_ctrl_alu_fn =
    {|{&{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_104, &_id_ctrl_decoder_decoded_T_180, &_id_ctrl_decoder_decoded_T_184, &_id_ctrl_decoder_decoded_T_186, &_id_ctrl_decoder_decoded_T_188},
     |{&_id_ctrl_decoder_decoded_T_78, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[14]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_104, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[3], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_148},
     |{&{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[11], _GEN_0[12]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[13]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]},
       &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]},
       &_id_ctrl_decoder_decoded_T_180,
       &_id_ctrl_decoder_decoded_T_184,
       &_id_ctrl_decoder_decoded_T_186,
       &_id_ctrl_decoder_decoded_T_188},
     |{&_id_ctrl_decoder_decoded_T_54, &_id_ctrl_decoder_decoded_T_58, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11]}, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_110, &_id_ctrl_decoder_decoded_T_116, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[14]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[14], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]}}};	// @[Cat.scala:33:92, Decode.scala:50:77, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  wire [31:0]      inst = _ibuf_io_inst_0_bits_rvc ? {16'h0, _ibuf_io_inst_0_bits_raw[15:0]} : _ibuf_io_inst_0_bits_raw;	// @[RocketCore.scala:286:20, :550:{21,62}]
  wire [7:0]       _id_ctrl_decoder_decoded_T_38 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[11]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [14:0]      _id_ctrl_decoder_decoded_T_56 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [15:0]      _id_ctrl_decoder_decoded_T_60 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[3], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [15:0]      _id_ctrl_decoder_decoded_T_112 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _ibuf_io_inst_0_bits_inst_bits[3], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_122 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[14]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]       _id_ctrl_decoder_decoded_T_126 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12], _ibuf_io_inst_0_bits_inst_bits[14]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_132 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [8:0]       _id_ctrl_decoder_decoded_T_136 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[13], _ibuf_io_inst_0_bits_inst_bits[14]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [13:0]      _id_ctrl_decoder_decoded_T_164 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _ibuf_io_inst_0_bits_inst_bits[27], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[27], _GEN_0[28], _GEN_0[29]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [3:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T_19 = {&_id_ctrl_decoder_decoded_T_18, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]}, &_id_ctrl_decoder_decoded_T_164, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29]}};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [2:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T_21 = {&_id_ctrl_decoder_decoded_T_156, &_id_ctrl_decoder_decoded_T_164, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[30]}};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [2:0]       _id_ctrl_decoder_decoded_orMatrixOutputs_T_23 = {&_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[31]}};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29, :98:74]
  wire [2:0]       _T_35 = {_ibuf_io_inst_0_bits_xcpt1_pf_inst, _ibuf_io_inst_0_bits_xcpt1_gf_inst, _ibuf_io_inst_0_bits_xcpt1_ae_inst};	// @[RocketCore.scala:286:20, :513:22]
  wire             _mem_reg_store_T_3 = ex_ctrl_mem_cmd == 5'h7;	// @[RocketCore.scala:217:20, :574:40]
  wire             _mem_reg_store_T_5 = ex_ctrl_mem_cmd == 5'h4;	// @[RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_6 = ex_ctrl_mem_cmd == 5'h9;	// @[RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_7 = ex_ctrl_mem_cmd == 5'hA;	// @[RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_8 = ex_ctrl_mem_cmd == 5'hB;	// @[RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_12 = ex_ctrl_mem_cmd == 5'h8;	// @[RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_13 = ex_ctrl_mem_cmd == 5'hC;	// @[Mux.scala:47:70, RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_14 = ex_ctrl_mem_cmd == 5'hD;	// @[Mux.scala:47:70, RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_15 = ex_ctrl_mem_cmd == 5'hE;	// @[Mux.scala:47:70, RocketCore.scala:217:20, package.scala:16:47]
  wire             _mem_reg_store_T_16 = ex_ctrl_mem_cmd == 5'hF;	// @[Mux.scala:47:70, RocketCore.scala:217:20, package.scala:16:47]
  wire             _T_69 = ex_ctrl_jalr & _csr_io_status_debug;	// @[RocketCore.scala:217:20, :315:19, :644:24]
  wire [3:0][63:0] _GEN_6 = {{ex_rs_1}, {{2{ex_rs_1[31:0]}}}, {{2{{2{ex_rs_1[15:0]}}}}}, {{2{{2{{2{ex_rs_1[7:0]}}}}}}}};	// @[AMOALU.scala:27:{13,19,62}, Cat.scala:33:92, RocketCore.scala:415:14]
  wire [31:0]      _T_143 = r & ~(ll_wen ? 32'h1 << ll_waddr : 32'h0);	// @[RocketCore.scala:744:29, :745:27, :755:44, :759:14, :760:12, :1127:{62,64}, :1132:40, :1135:{49,58}]
  wire             _T_145 = wb_set_sboard & wb_wen;	// @[RocketCore.scala:729:53, :764:25, :855:28]
  wire [31:0]      _id_stall_fpu_T_3 = 32'h1 << wb_reg_inst[11:7];	// @[RocketCore.scala:275:24, :401:29, :1135:58]
  wire             _id_stall_fpu_T_6 = (wb_dcache_miss & wb_ctrl_wfd | io_fpu_sboard_set) & wb_valid;	// @[RocketCore.scala:219:20, :567:36, :763:45, :880:{35,50,72}]
  wire [31:0]      _id_stall_fpu_T_4 = _id_stall_fpu_T_6 ? _id_stall_fpu_T_3 : 32'h0;	// @[RocketCore.scala:880:72, :1135:{49,58}]
  wire             _id_stall_fpu_T_7 = dmem_resp_replay & io_dmem_resp_bits_tag[0];	// @[RocketCore.scala:736:45, :740:42, :881:38]
  wire [8:0]       _id_ctrl_decoder_decoded_T_10 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _ibuf_io_inst_0_bits_inst_bits[3], _GEN_0[2], _GEN_0[3], _GEN_0[4], _GEN_0[11], _GEN_0[12]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire [7:0]       _id_ctrl_decoder_decoded_T_62 = {_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11]};	// @[Cat.scala:33:92, RocketCore.scala:286:20, pla.scala:78:21, :90:45, :91:29]
  wire             id_bypass_src_1_0 = _ibuf_io_inst_0_bits_inst_rs2 == 5'h0;	// @[RocketCore.scala:286:20, :1152:41]
  wire             id_system_insn = id_ctrl_csr == 3'h4;	// @[Decode.scala:50:77, RocketCore.scala:317:36, :1178:22]
  wire             id_csr_ren = (_id_csr_ren_T | (&id_ctrl_csr)) & ~(|_ibuf_io_inst_0_bits_inst_rs1);	// @[Decode.scala:50:77, RocketCore.scala:286:20, :318:{54,81}, :1152:41, package.scala:16:47, :73:59]
  wire             id_illegal_insn =
    {&_id_ctrl_decoder_decoded_T,
     &_id_ctrl_decoder_decoded_T_4,
     &_id_ctrl_decoder_decoded_T_6,
     &_id_ctrl_decoder_decoded_T_10,
     &_id_ctrl_decoder_decoded_T_12,
     &_id_ctrl_decoder_decoded_T_14,
     &_id_ctrl_decoder_decoded_T_22,
     &_id_ctrl_decoder_decoded_T_26,
     &_id_ctrl_decoder_decoded_T_28,
     &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[2], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[23], _GEN_0[24]},
     &_id_ctrl_decoder_decoded_T_36,
     &_id_ctrl_decoder_decoded_T_42,
     &_id_ctrl_decoder_decoded_T_46,
     &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _GEN_0[19], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[28], _GEN_0[29]},
     &_id_ctrl_decoder_decoded_T_54,
     &_id_ctrl_decoder_decoded_T_58,
     &_id_ctrl_decoder_decoded_T_62,
     &_id_ctrl_decoder_decoded_T_70,
     &_id_ctrl_decoder_decoded_T_78,
     &_id_ctrl_decoder_decoded_T_86,
     &_id_ctrl_decoder_decoded_T_92,
     &_id_ctrl_decoder_decoded_T_104,
     &_id_ctrl_decoder_decoded_T_106,
     &_id_ctrl_decoder_decoded_T_110,
     &_id_ctrl_decoder_decoded_T_116,
     &_id_ctrl_decoder_decoded_T_148,
     &_id_ctrl_decoder_decoded_T_154,
     &_id_ctrl_decoder_decoded_T_158,
     &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _ibuf_io_inst_0_bits_inst_bits[20], _GEN_0[19], _ibuf_io_inst_0_bits_inst_bits[22], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _GEN_0[28], _GEN_0[29]},
     &_id_ctrl_decoder_decoded_T_166,
     &_id_ctrl_decoder_decoded_T_168,
     &_id_ctrl_decoder_decoded_T_170,
     &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _GEN_0[18], _ibuf_io_inst_0_bits_inst_bits[21], _GEN_0[20], _GEN_0[21], _GEN_0[22], _GEN_0[23], _GEN_0[24], _GEN_0[25], _ibuf_io_inst_0_bits_inst_bits[28], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28], _GEN_0[29]},
     &_id_ctrl_decoder_decoded_T_190,
     &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[5], _GEN_0[6], _GEN_0[7], _GEN_0[8], _GEN_0[9], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[13], _GEN_0[14], _GEN_0[15], _GEN_0[16], _GEN_0[17], _GEN_0[18], _ibuf_io_inst_0_bits_inst_bits[21], _GEN_0[20], _GEN_0[21], _ibuf_io_inst_0_bits_inst_bits[24], _ibuf_io_inst_0_bits_inst_bits[25], _GEN_0[24], _ibuf_io_inst_0_bits_inst_bits[27], _ibuf_io_inst_0_bits_inst_bits[28], _ibuf_io_inst_0_bits_inst_bits[29], _ibuf_io_inst_0_bits_inst_bits[30], _GEN_0[29]},
     &_id_ctrl_decoder_decoded_T_202,
     &_id_ctrl_decoder_decoded_T_208,
     &_id_ctrl_decoder_decoded_T_210} == 38'h0 | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_10) & ~(_csr_io_status_isa[12]) | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T) & ~(_csr_io_status_isa[0]) | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_60) & (_csr_io_decode_0_fp_illegal | io_fpu_illegal_rm) | _ibuf_io_inst_0_bits_rvc & ~(_csr_io_status_isa[2]) | id_csr_en & (_csr_io_decode_0_read_illegal | ~id_csr_ren & _csr_io_decode_0_write_illegal) | ~_ibuf_io_inst_0_bits_rvc & id_system_insn & _csr_io_decode_0_system_illegal;	// @[Cat.scala:33:92, RocketCore.scala:286:20, :315:19, :317:36, :318:54, :320:54, :330:{34,37,55}, :331:{17,20,38}, :332:{16,48}, :334:{30,33,51}, :340:{15,49,64,99}, :341:{5,31}, package.scala:73:59, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
  wire             id_xcpt = _csr_io_interrupt | _bpu_io_debug_if | _bpu_io_xcpt_if | _ibuf_io_inst_0_bits_xcpt0_pf_inst | _ibuf_io_inst_0_bits_xcpt0_gf_inst | _ibuf_io_inst_0_bits_xcpt0_ae_inst | _ibuf_io_inst_0_bits_xcpt1_pf_inst | _ibuf_io_inst_0_bits_xcpt1_gf_inst | _ibuf_io_inst_0_bits_xcpt1_ae_inst | id_illegal_insn;	// @[RocketCore.scala:286:20, :315:19, :340:99, :360:19, :1104:26]
  wire             _T_27 = ex_reg_valid & ex_ctrl_wxd;	// @[RocketCore.scala:217:20, :222:35, :404:19]
  wire             _T_30 = _dcache_kill_mem_T & ~mem_ctrl_mem;	// @[RocketCore.scala:218:21, :405:{20,36,39}]
  wire             id_bypass_src_1_1 = _T_27 & _fp_data_hazard_ex_T_3;	// @[RocketCore.scala:404:19, :407:{74,82}]
  wire             id_bypass_src_1_2 = _T_30 & _fp_data_hazard_mem_T_3;	// @[RocketCore.scala:405:36, :407:{74,82}]
  wire             do_bypass_1 = id_bypass_src_1_0 | id_bypass_src_1_1 | id_bypass_src_1_2 | _dcache_kill_mem_T & _fp_data_hazard_mem_T_3;	// @[RocketCore.scala:405:20, :407:{74,82}, :540:48, :1152:41]
  wire             _T_52 = (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_54) & ~do_bypass_1;	// @[Cat.scala:33:92, RocketCore.scala:540:48, :544:{23,26}, pla.scala:114:39]
  wire             mem_pc_valid = mem_reg_valid | mem_reg_replay | mem_reg_xcpt_interrupt;	// @[RocketCore.scala:239:36, :240:36, :244:36, :584:54]
  wire             mem_npc_misaligned = ~(_csr_io_status_isa[2]) & _mem_npc_T_4[1] & ~mem_reg_sfence;	// @[RocketCore.scala:250:27, :315:19, :334:51, :589:21, :593:{28,66,70,73}]
  wire             _T_65 = mem_reg_valid & mem_reg_flush_pipe;	// @[RocketCore.scala:240:36, :245:36, :608:23]
  wire             _T_70 = mem_reg_xcpt_interrupt | mem_reg_xcpt;	// @[RocketCore.scala:239:36, :243:36, :658:29]
  wire             _T_71 = mem_reg_valid & mem_npc_misaligned;	// @[RocketCore.scala:240:36, :593:70, :659:20]
  wire             mem_xcpt = _T_70 | _T_71 | mem_reg_valid & mem_ldst_xcpt;	// @[RocketCore.scala:240:36, :658:29, :659:20, :660:20, :1104:26]
  wire             ctrl_killm = killm_common | mem_xcpt | fpu_kill_mem;	// @[RocketCore.scala:670:51, :672:68, :674:45, :1104:26]
  wire             id_bypass_src_0_1 = _T_27 & _fp_data_hazard_ex_T_1;	// @[RocketCore.scala:404:19, :407:{74,82}]
  wire             id_bypass_src_0_2 = _T_30 & _fp_data_hazard_mem_T_1;	// @[RocketCore.scala:405:36, :407:{74,82}]
  wire             do_bypass = ~(|_ibuf_io_inst_0_bits_inst_rs1) | id_bypass_src_0_1 | id_bypass_src_0_2 | _dcache_kill_mem_T & _fp_data_hazard_mem_T_1;	// @[RocketCore.scala:286:20, :405:20, :407:{74,82}, :540:48, :1152:41]
  always @(posedge clock) begin
    id_reg_pause <= ~(_csr_io_time[4:0] == 5'h0 | _csr_io_inhibit_cycle | take_pc_mem_wb) & (~ctrl_killd & (&_id_ctrl_decoder_decoded_T_10) & _ibuf_io_inst_0_bits_inst_bits[23:20] == 4'h0 | id_reg_pause);	// @[Cat.scala:33:92, RocketCore.scala:129:25, :282:35, :286:20, :315:19, :350:33, :495:19, :500:22, :506:{42,51,66}, :909:104, :990:{28,62,118}, :991:{18,33}, pla.scala:98:74]
    imem_might_request_reg <= ex_pc_valid | mem_pc_valid | _csr_io_customCSRs_0_value[1];	// @[CustomCSRs.scala:38:61, RocketCore.scala:130:35, :315:19, :566:51, :584:54, :919:59]
    if (ctrl_killd) begin	// @[RocketCore.scala:909:104]
    end
    else begin	// @[RocketCore.scala:909:104]
      ex_ctrl_fp <= |_id_ctrl_decoder_decoded_orMatrixOutputs_T_60;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:114:39]
      ex_ctrl_branch <= |{&_id_ctrl_decoder_decoded_T_38, &_id_ctrl_decoder_decoded_T_104};	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:98:74, :114:39]
      ex_ctrl_jal <= &_id_ctrl_decoder_decoded_T_46;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:98:74]
      ex_ctrl_jalr <= &_id_ctrl_decoder_decoded_T_44;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:98:74]
      ex_ctrl_rxs2 <= |_id_ctrl_decoder_decoded_orMatrixOutputs_T_54;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:114:39]
      ex_ctrl_rxs1 <= |_id_ctrl_decoder_decoded_orMatrixOutputs_T_52;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:114:39]
      if (id_xcpt) begin	// @[RocketCore.scala:1104:26]
        if (_T_39)	// @[RocketCore.scala:518:28]
          ex_ctrl_sel_alu2 <= 2'h0;	// @[RocketCore.scala:217:20]
        else	// @[RocketCore.scala:518:28]
          ex_ctrl_sel_alu2 <= {1'h0, |_T_35};	// @[RocketCore.scala:217:20, :512:24, :513:{22,29,34}, :515:26]
        if (_T_39 | (|_T_35))	// @[RocketCore.scala:511:24, :513:{22,29,34}, :514:26, :518:{28,52}, :519:26]
          ex_ctrl_sel_alu1 <= 2'h2;	// @[Mux.scala:47:70, RocketCore.scala:217:20]
        else	// @[RocketCore.scala:511:24, :513:34, :514:26, :518:52, :519:26]
          ex_ctrl_sel_alu1 <= 2'h1;	// @[Mux.scala:81:61, RocketCore.scala:217:20]
        ex_ctrl_alu_fn <= 4'h0;	// @[RocketCore.scala:217:20]
      end
      else begin	// @[RocketCore.scala:1104:26]
        ex_ctrl_sel_alu2 <= {|{&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_6, &_id_ctrl_decoder_decoded_T_12, &_id_ctrl_decoder_decoded_T_14, &_id_ctrl_decoder_decoded_T_22, &_id_ctrl_decoder_decoded_T_26, &_id_ctrl_decoder_decoded_T_28, &_id_ctrl_decoder_decoded_T_38, &_id_ctrl_decoder_decoded_T_42, &_id_ctrl_decoder_decoded_T_54, &_id_ctrl_decoder_decoded_T_58, &_id_ctrl_decoder_decoded_T_70, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_110, &_id_ctrl_decoder_decoded_T_116, &_id_ctrl_decoder_decoded_T_122, &_id_ctrl_decoder_decoded_T_132, &_id_ctrl_decoder_decoded_T_148}, |{&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_6, &_id_ctrl_decoder_decoded_T_12, &_id_ctrl_decoder_decoded_T_14, &_id_ctrl_decoder_decoded_T_44, &_id_ctrl_decoder_decoded_T_46, &_id_ctrl_decoder_decoded_T_56, &_id_ctrl_decoder_decoded_T_60, &_id_ctrl_decoder_decoded_T_70, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_112, &_id_ctrl_decoder_decoded_T_126, &_id_ctrl_decoder_decoded_T_136}};	// @[Cat.scala:33:92, Decode.scala:50:77, RocketCore.scala:217:20, pla.scala:98:74, :114:39]
        ex_ctrl_sel_alu1 <= {|{&{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _GEN_0[4]}, &_id_ctrl_decoder_decoded_T_46}, |{&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_6, &_id_ctrl_decoder_decoded_T_12, &_id_ctrl_decoder_decoded_T_22, &_id_ctrl_decoder_decoded_T_26, &_id_ctrl_decoder_decoded_T_28, &_id_ctrl_decoder_decoded_T_42, &_id_ctrl_decoder_decoded_T_54, &_id_ctrl_decoder_decoded_T_58, &_id_ctrl_decoder_decoded_T_66, &_id_ctrl_decoder_decoded_T_70, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_94, &_id_ctrl_decoder_decoded_T_104, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_110, &_id_ctrl_decoder_decoded_T_116, &_id_ctrl_decoder_decoded_T_148, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156, &_id_ctrl_decoder_decoded_T_206, &_id_ctrl_decoder_decoded_T_212}};	// @[Cat.scala:33:92, Decode.scala:50:77, RocketCore.scala:217:20, :286:20, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
        ex_ctrl_alu_fn <= id_ctrl_alu_fn;	// @[Decode.scala:50:77, RocketCore.scala:217:20]
      end
      ex_ctrl_sel_imm <= {|{&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_8, &_id_ctrl_decoder_decoded_T_12, &_id_ctrl_decoder_decoded_T_44, &_id_ctrl_decoder_decoded_T_56, &_id_ctrl_decoder_decoded_T_60, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[1], _GEN_0[2], _GEN_0[3], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]}, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_106, &_id_ctrl_decoder_decoded_T_112, &_id_ctrl_decoder_decoded_T_126, &_id_ctrl_decoder_decoded_T_136}, |{&_id_ctrl_decoder_decoded_T_14, &_id_ctrl_decoder_decoded_T_46}, |{&_id_ctrl_decoder_decoded_T_38, &_id_ctrl_decoder_decoded_T_46, &_id_ctrl_decoder_decoded_T_122, &_id_ctrl_decoder_decoded_T_132}};	// @[Cat.scala:33:92, Decode.scala:50:77, RocketCore.scala:217:20, :286:20, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
      ex_ctrl_alu_dw <= id_xcpt | (|{&_id_ctrl_decoder_decoded_T, &_id_ctrl_decoder_decoded_T_4, &_id_ctrl_decoder_decoded_T_6, &_id_ctrl_decoder_decoded_T_14, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _GEN_0[11], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_26, &_id_ctrl_decoder_decoded_T_42, &_id_ctrl_decoder_decoded_T_46, &_id_ctrl_decoder_decoded_T_54, &_id_ctrl_decoder_decoded_T_62, &_id_ctrl_decoder_decoded_T_70, &_id_ctrl_decoder_decoded_T_78, &_id_ctrl_decoder_decoded_T_86, &_id_ctrl_decoder_decoded_T_92, &_id_ctrl_decoder_decoded_T_104, &_id_ctrl_decoder_decoded_T_106, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _ibuf_io_inst_0_bits_inst_bits[12], _GEN_0[11], _ibuf_io_inst_0_bits_inst_bits[14], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _GEN_0[27], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_154, &_id_ctrl_decoder_decoded_T_156});	// @[Cat.scala:33:92, RocketCore.scala:217:20, :286:20, :501:13, :508:20, :510:22, :1104:26, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
      ex_ctrl_mem <= |_id_ctrl_decoder_decoded_orMatrixOutputs_T_26;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:114:39]
      ex_ctrl_mem_cmd <= {1'h0, &_id_ctrl_decoder_decoded_T_86, |_id_ctrl_decoder_decoded_orMatrixOutputs_T_23, |_id_ctrl_decoder_decoded_orMatrixOutputs_T_21, |_id_ctrl_decoder_decoded_orMatrixOutputs_T_19};	// @[Cat.scala:33:92, Decode.scala:50:77, RocketCore.scala:217:20, pla.scala:98:74, :114:39]
      ex_ctrl_rfs1 <= |{&_id_ctrl_decoder_decoded_T_32, &_id_ctrl_decoder_decoded_T_36, &_id_ctrl_decoder_decoded_T_166, &_id_ctrl_decoder_decoded_T_168, &_id_ctrl_decoder_decoded_T_170, &_id_ctrl_decoder_decoded_T_190, &_id_ctrl_decoder_decoded_T_204, &_id_ctrl_decoder_decoded_T_210};	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:98:74, :114:39]
      ex_ctrl_rfs2 <= |{&_id_ctrl_decoder_decoded_T_32, &_id_ctrl_decoder_decoded_T_36, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _GEN_0[1], _GEN_0[2], _ibuf_io_inst_0_bits_inst_bits[5], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]}, &_id_ctrl_decoder_decoded_T_166, &_id_ctrl_decoder_decoded_T_168, &_id_ctrl_decoder_decoded_T_170, &_id_ctrl_decoder_decoded_T_190};	// @[Cat.scala:33:92, RocketCore.scala:217:20, :286:20, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
      ex_ctrl_wfd <= |{&_id_ctrl_decoder_decoded_T_32, &_id_ctrl_decoder_decoded_T_36, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _ibuf_io_inst_0_bits_inst_bits[2], _GEN_0[1], _GEN_0[2], _GEN_0[3], _GEN_0[4], _GEN_0[10], _ibuf_io_inst_0_bits_inst_bits[13], _GEN_0[12]}, &_id_ctrl_decoder_decoded_T_170, &{_ibuf_io_inst_0_bits_inst_bits[0], _ibuf_io_inst_0_bits_inst_bits[1], _GEN_0[0], _GEN_0[1], _ibuf_io_inst_0_bits_inst_bits[4], _GEN_0[3], _ibuf_io_inst_0_bits_inst_bits[6], _GEN_0[10], _GEN_0[12], _GEN_0[23], _GEN_0[24], _GEN_0[25], _GEN_0[26], _ibuf_io_inst_0_bits_inst_bits[29], _GEN_0[28], _GEN_0[29]}, &_id_ctrl_decoder_decoded_T_190, &_id_ctrl_decoder_decoded_T_206, &_id_ctrl_decoder_decoded_T_212};	// @[Cat.scala:33:92, RocketCore.scala:217:20, :286:20, pla.scala:78:21, :90:45, :91:29, :98:74, :114:39]
      ex_ctrl_div <= |_id_ctrl_decoder_decoded_orMatrixOutputs_T_10;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:114:39]
      ex_ctrl_wxd <= |_id_ctrl_decoder_decoded_orMatrixOutputs_T_8;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:114:39]
      if (id_system_insn & (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_26))	// @[Cat.scala:33:92, RocketCore.scala:317:36, :319:35, pla.scala:114:39]
        ex_ctrl_csr <= 3'h0;	// @[RocketCore.scala:217:20, :1175:24]
      else if (id_csr_ren)	// @[RocketCore.scala:318:54]
        ex_ctrl_csr <= 3'h2;	// @[RocketCore.scala:217:20, :1168:26]
      else	// @[RocketCore.scala:318:54]
        ex_ctrl_csr <= id_ctrl_csr;	// @[Decode.scala:50:77, RocketCore.scala:217:20]
      ex_ctrl_fence_i <= &_id_ctrl_decoder_decoded_T_52;	// @[Cat.scala:33:92, RocketCore.scala:217:20, pla.scala:98:74]
      ex_reg_rvc <= id_xcpt & (|_T_35) | _ibuf_io_inst_0_bits_rvc;	// @[RocketCore.scala:223:35, :286:20, :502:16, :508:20, :513:{22,29,34}, :516:20, :1104:26]
      ex_reg_flush_pipe <= (&_id_ctrl_decoder_decoded_T_52) | id_system_insn | id_csr_en & ~id_csr_ren & _csr_io_decode_0_write_flush;	// @[Cat.scala:33:92, RocketCore.scala:226:35, :315:19, :317:36, :318:54, :320:{54,66}, :523:42, package.scala:73:59, pla.scala:98:74]
      ex_reg_load_use <= mem_reg_valid & data_hazard_mem & mem_ctrl_mem;	// @[RocketCore.scala:218:21, :227:35, :240:36, :868:38, :871:51]
      if ({&_id_ctrl_decoder_decoded_T_86, |_id_ctrl_decoder_decoded_orMatrixOutputs_T_23, |_id_ctrl_decoder_decoded_orMatrixOutputs_T_21, |_id_ctrl_decoder_decoded_orMatrixOutputs_T_19} == 4'h5)	// @[Cat.scala:33:92, Decode.scala:50:77, package.scala:16:47, pla.scala:98:74, :114:39]
        ex_reg_mem_size <= {|_ibuf_io_inst_0_bits_inst_rs2, |_ibuf_io_inst_0_bits_inst_rs1};	// @[Cat.scala:33:92, RocketCore.scala:231:28, :286:20, :528:{40,59}]
      else	// @[package.scala:16:47]
        ex_reg_mem_size <= _ibuf_io_inst_0_bits_inst_bits[13:12];	// @[RocketCore.scala:231:28, :286:20, :526:95]
      ex_reg_rs_bypass_0 <= ~id_illegal_insn & do_bypass;	// @[RocketCore.scala:340:99, :411:29, :540:48, :542:27, :549:47, :551:27]
      ex_reg_rs_bypass_1 <= do_bypass_1;	// @[RocketCore.scala:411:29, :540:48]
      if (id_illegal_insn) begin	// @[RocketCore.scala:340:99]
        ex_reg_rs_lsb_0 <= inst[1:0];	// @[RocketCore.scala:412:26, :550:21, :552:31]
        ex_reg_rs_msb_0 <= {32'h0, inst[31:2]};	// @[RocketCore.scala:413:26, :544:38, :549:47, :550:21, :553:{24,32}]
      end
      else if ((|_id_ctrl_decoder_decoded_orMatrixOutputs_T_52) & ~do_bypass) begin	// @[Cat.scala:33:92, RocketCore.scala:540:48, :544:{23,26}, pla.scala:114:39]
        ex_reg_rs_lsb_0 <= id_rs_0[1:0];	// @[RocketCore.scala:412:26, :545:37, :772:17, :1152:19, :1157:25, :1160:{31,39}]
        ex_reg_rs_msb_0 <= id_rs_0[63:2];	// @[RocketCore.scala:413:26, :546:38, :772:17, :1152:19, :1157:25, :1160:{31,39}]
      end
      else if (|_ibuf_io_inst_0_bits_inst_rs1) begin	// @[RocketCore.scala:286:20, :1152:41]
        if (id_bypass_src_0_1)	// @[RocketCore.scala:407:74]
          ex_reg_rs_lsb_0 <= 2'h1;	// @[Mux.scala:81:61, RocketCore.scala:412:26]
        else	// @[RocketCore.scala:407:74]
          ex_reg_rs_lsb_0 <= {1'h1, ~id_bypass_src_0_2};	// @[Mux.scala:47:70, RocketCore.scala:407:74, :412:26]
      end
      else	// @[RocketCore.scala:1152:41]
        ex_reg_rs_lsb_0 <= 2'h0;	// @[RocketCore.scala:412:26]
      if (_T_52)	// @[RocketCore.scala:544:23]
        ex_reg_rs_lsb_1 <= id_rs_1[1:0];	// @[RocketCore.scala:412:26, :545:37, :772:17, :1152:19, :1157:25, :1160:{31,39}]
      else if (id_bypass_src_1_0)	// @[RocketCore.scala:1152:41]
        ex_reg_rs_lsb_1 <= 2'h0;	// @[RocketCore.scala:412:26]
      else if (id_bypass_src_1_1)	// @[RocketCore.scala:407:74]
        ex_reg_rs_lsb_1 <= 2'h1;	// @[Mux.scala:81:61, RocketCore.scala:412:26]
      else	// @[RocketCore.scala:407:74]
        ex_reg_rs_lsb_1 <= {1'h1, ~id_bypass_src_1_2};	// @[Mux.scala:47:70, RocketCore.scala:407:74, :412:26]
    end
    ex_ctrl_rocc <= ctrl_killd & ex_ctrl_rocc;	// @[RocketCore.scala:217:20, :500:22, :501:13, :909:104]
    ex_ctrl_zbk <= ctrl_killd & ex_ctrl_zbk;	// @[RocketCore.scala:217:20, :500:22, :501:13, :909:104]
    ex_ctrl_zkn <= ctrl_killd & ex_ctrl_zkn;	// @[RocketCore.scala:217:20, :500:22, :501:13, :909:104]
    ex_ctrl_zks <= ctrl_killd & ex_ctrl_zks;	// @[RocketCore.scala:217:20, :500:22, :501:13, :909:104]
    ex_ctrl_mul <= ctrl_killd & ex_ctrl_mul;	// @[RocketCore.scala:217:20, :500:22, :501:13, :909:104]
    if (_T_65 | ~ex_pc_valid) begin	// @[RocketCore.scala:218:21, :566:51, :608:{23,46}, :610:28]
    end
    else begin	// @[RocketCore.scala:218:21, :608:46, :610:28]
      mem_ctrl_fp <= ex_ctrl_fp;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_rocc <= ex_ctrl_rocc;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_branch <= ex_ctrl_branch;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_jal <= ex_ctrl_jal;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_jalr <= ex_ctrl_jalr;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_rxs2 <= ex_ctrl_rxs2;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_rxs1 <= ex_ctrl_rxs1;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_mem <= ex_ctrl_mem;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_rfs1 <= ex_ctrl_rfs1;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_rfs2 <= ex_ctrl_rfs2;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_wfd <= ex_ctrl_wfd;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_mul <= ex_ctrl_mul;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_div <= ex_ctrl_div;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_wxd <= ex_ctrl_wxd;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_csr <= ex_ctrl_csr;	// @[RocketCore.scala:217:20, :218:21]
      mem_ctrl_fence_i <= _T_69 | ex_ctrl_fence_i;	// @[RocketCore.scala:217:20, :218:21, :611:14, :644:{24,48}, :646:24]
      mem_reg_rvc <= ex_reg_rvc;	// @[RocketCore.scala:223:35, :241:36]
      mem_reg_flush_pipe <= _T_69 | ex_reg_flush_pipe;	// @[RocketCore.scala:226:35, :245:36, :619:24, :644:{24,48}, :647:26]
      mem_reg_cause <= ex_reg_cause;	// @[RocketCore.scala:228:35, :246:36]
      mem_reg_slow_bypass <= _mem_reg_store_T_3 | ~(ex_reg_mem_size[1]);	// @[RocketCore.scala:231:28, :247:36, :574:{40,50,69}]
      mem_reg_load <= ex_ctrl_mem & (ex_ctrl_mem_cmd == 5'h0 | ex_ctrl_mem_cmd == 5'h10 | ex_ctrl_mem_cmd == 5'h6 | _mem_reg_store_T_3 | _mem_reg_store_T_5 | _mem_reg_store_T_6 | _mem_reg_store_T_7 | _mem_reg_store_T_8 | _mem_reg_store_T_12 | _mem_reg_store_T_13 | _mem_reg_store_T_14 | _mem_reg_store_T_15 | _mem_reg_store_T_16);	// @[Consts.scala:85:68, RocketCore.scala:217:20, :248:36, :574:40, :615:33, package.scala:16:47]
      mem_reg_store <= ex_ctrl_mem & (ex_ctrl_mem_cmd == 5'h1 | ex_ctrl_mem_cmd == 5'h11 | _mem_reg_store_T_3 | _mem_reg_store_T_5 | _mem_reg_store_T_6 | _mem_reg_store_T_7 | _mem_reg_store_T_8 | _mem_reg_store_T_12 | _mem_reg_store_T_13 | _mem_reg_store_T_14 | _mem_reg_store_T_15 | _mem_reg_store_T_16);	// @[Consts.scala:86:{32,49,76}, Mux.scala:47:70, RocketCore.scala:217:20, :249:36, :574:40, :616:34, package.scala:16:47]
      mem_reg_pc <= ex_reg_pc;	// @[RocketCore.scala:230:22, :251:23]
      mem_reg_inst <= ex_reg_inst;	// @[RocketCore.scala:233:24, :252:25]
      mem_reg_hls_or_dv <= ex_reg_hls;	// @[RocketCore.scala:232:23, :254:30]
      mem_reg_raw_inst <= ex_reg_raw_inst;	// @[RocketCore.scala:234:28, :255:29]
      mem_scie_pipelined <= ex_scie_pipelined;	// @[RocketCore.scala:236:30, :257:31]
      if (ex_scie_unpipelined | ex_ctrl_zbk | ex_ctrl_zkn | ex_ctrl_zks)	// @[Mux.scala:27:73, RocketCore.scala:217:20, :235:32]
        mem_reg_wdata <= 64'h0;	// @[RocketCore.scala:258:26]
      else	// @[Mux.scala:27:73]
        mem_reg_wdata <= _alu_io_out;	// @[RocketCore.scala:258:26, :425:19]
      mem_br_taken <= _alu_io_cmp_out;	// @[RocketCore.scala:260:25, :425:19]
    end
    if (mem_pc_valid) begin	// @[RocketCore.scala:584:54]
      wb_ctrl_rocc <= mem_ctrl_rocc;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_rxs2 <= mem_ctrl_rxs2;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_rxs1 <= mem_ctrl_rxs1;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_mem <= mem_ctrl_mem;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_rfs1 <= mem_ctrl_rfs1;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_rfs2 <= mem_ctrl_rfs2;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_wfd <= mem_ctrl_wfd;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_div <= mem_ctrl_div;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_wxd <= mem_ctrl_wxd;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_csr <= mem_ctrl_csr;	// @[RocketCore.scala:218:21, :219:20]
      wb_ctrl_fence_i <= mem_ctrl_fence_i;	// @[RocketCore.scala:218:21, :219:20]
      if (_T_70)	// @[RocketCore.scala:658:29]
        wb_reg_cause <= mem_reg_cause;	// @[RocketCore.scala:246:36, :268:35]
      else	// @[RocketCore.scala:658:29]
        wb_reg_cause <= {60'h0, _T_71 ? 4'h0 : mem_debug_breakpoint ? 4'hE : 4'h3};	// @[Mux.scala:47:70, RocketCore.scala:268:35, :652:64, :659:20]
      wb_reg_sfence <= mem_reg_sfence;	// @[RocketCore.scala:250:27, :269:26]
      wb_reg_pc <= mem_reg_pc;	// @[RocketCore.scala:251:23, :270:22]
      wb_reg_hls_or_dv <= mem_reg_hls_or_dv;	// @[RocketCore.scala:254:30, :272:29]
      wb_reg_inst <= mem_reg_inst;	// @[RocketCore.scala:252:25, :275:24]
      wb_reg_raw_inst <= mem_reg_raw_inst;	// @[RocketCore.scala:255:29, :276:28]
      if (mem_scie_pipelined)	// @[RocketCore.scala:257:31]
        wb_reg_wdata <= 64'h0;	// @[RocketCore.scala:277:25]
      else if (~mem_reg_xcpt & mem_ctrl_fp & mem_ctrl_wxd)	// @[RocketCore.scala:218:21, :243:36, :594:27, :685:40]
        wb_reg_wdata <= io_fpu_toint_data;	// @[RocketCore.scala:277:25]
      else if (~mem_reg_xcpt & (mem_ctrl_jalr ^ mem_npc_misaligned))	// @[RocketCore.scala:218:21, :243:36, :593:70, :594:{27,41,59}]
        wb_reg_wdata <= {{30{_mem_br_target_T_10[33]}}, _mem_br_target_T_10};	// @[RocketCore.scala:277:25, :585:41, :594:26]
      else	// @[RocketCore.scala:594:41]
        wb_reg_wdata <= mem_reg_wdata;	// @[RocketCore.scala:258:26, :277:25]
    end
    ex_reg_xcpt_interrupt <= ~take_pc_mem_wb & _ibuf_io_inst_0_valid & _csr_io_interrupt;	// @[RocketCore.scala:221:35, :282:35, :286:20, :315:19, :496:20, :498:62]
    ex_reg_valid <= ~ctrl_killd;	// @[RocketCore.scala:222:35, :495:19, :909:104]
    ex_reg_xcpt <= ~ctrl_killd & id_xcpt;	// @[RocketCore.scala:225:35, :495:19, :497:30, :909:104, :1104:26]
    if (~ctrl_killd | _csr_io_interrupt | _ibuf_io_inst_0_bits_replay) begin	// @[RocketCore.scala:286:20, :315:19, :495:19, :556:41, :909:104]
      if (_csr_io_interrupt)	// @[RocketCore.scala:315:19]
        ex_reg_cause <= _csr_io_interrupt_cause;	// @[RocketCore.scala:228:35, :315:19]
      else	// @[RocketCore.scala:315:19]
        ex_reg_cause <= {59'h0, _bpu_io_debug_if ? 5'hE : _bpu_io_xcpt_if ? 5'h3 : _ibuf_io_inst_0_bits_xcpt0_pf_inst ? 5'hC : _ibuf_io_inst_0_bits_xcpt0_gf_inst ? 5'h14 : _ibuf_io_inst_0_bits_xcpt0_ae_inst ? 5'h1 : _ibuf_io_inst_0_bits_xcpt1_pf_inst ? 5'hC : _ibuf_io_inst_0_bits_xcpt1_gf_inst ? 5'h14 : _ibuf_io_inst_0_bits_xcpt1_ae_inst ? 5'h1 : 5'h2};	// @[Mux.scala:47:70, RocketCore.scala:228:35, :286:20, :360:19]
      ex_reg_pc <= _ibuf_io_pc;	// @[RocketCore.scala:230:22, :286:20]
      ex_reg_inst <= _ibuf_io_inst_0_bits_inst_bits;	// @[RocketCore.scala:233:24, :286:20]
      ex_reg_raw_inst <= _ibuf_io_inst_0_bits_raw;	// @[RocketCore.scala:234:28, :286:20]
    end
    ex_reg_replay <= ~take_pc_mem_wb & _ibuf_io_inst_0_valid & _ibuf_io_inst_0_bits_replay;	// @[RocketCore.scala:229:26, :282:35, :286:20, :496:{20,54}]
    ex_reg_hls <= ctrl_killd & ex_reg_hls;	// @[RocketCore.scala:232:23, :500:22, :525:16, :909:104]
    ex_scie_unpipelined <= ctrl_killd & ex_scie_unpipelined;	// @[RocketCore.scala:235:32, :500:22, :504:25, :909:104]
    ex_scie_pipelined <= ctrl_killd & ex_scie_pipelined;	// @[RocketCore.scala:236:30, :500:22, :505:23, :909:104]
    mem_reg_xcpt_interrupt <= ~take_pc_mem_wb & ex_reg_xcpt_interrupt;	// @[RocketCore.scala:221:35, :239:36, :282:35, :496:20, :604:45]
    mem_reg_valid <= ~ctrl_killx;	// @[RocketCore.scala:240:36, :572:48, :601:20]
    mem_reg_xcpt <= ~ctrl_killx & (ex_reg_xcpt_interrupt | ex_reg_xcpt);	// @[RocketCore.scala:221:35, :225:35, :243:36, :572:48, :578:28, :601:20, :603:31]
    mem_reg_replay <= ~take_pc_mem_wb & replay_ex;	// @[RocketCore.scala:244:36, :282:35, :496:20, :571:33, :602:37]
    mem_reg_sfence <= ~(_T_65 | ex_pc_valid) & mem_reg_sfence;	// @[RocketCore.scala:250:27, :566:51, :608:{23,46}, :609:20, :610:28, :617:20]
    if (_T_65 | ~(ex_pc_valid & ex_ctrl_rxs2 & (ex_ctrl_mem | ex_ctrl_rocc))) begin	// @[RocketCore.scala:217:20, :259:24, :566:51, :608:{23,46}, :610:28, :640:{40,71}, :642:19]
    end
    else	// @[RocketCore.scala:259:24, :608:46, :610:28]
      mem_reg_rs2 <= _GEN_6[ex_ctrl_rocc ? 2'h3 : ex_reg_mem_size];	// @[AMOALU.scala:27:{13,19}, RocketCore.scala:217:20, :231:28, :259:24, :641:21]
    wb_reg_valid <= ~ctrl_killm;	// @[RocketCore.scala:264:35, :674:45, :677:19]
    wb_reg_xcpt <= mem_xcpt & ~take_pc_wb;	// @[RocketCore.scala:265:35, :678:34, :679:27, :733:53, :1104:26]
    wb_reg_replay <= (dcache_kill_mem | mem_reg_replay | fpu_kill_mem) & ~take_pc_wb;	// @[RocketCore.scala:244:36, :266:35, :669:55, :670:51, :671:55, :678:{31,34}, :733:53]
    wb_reg_flush_pipe <= ~ctrl_killm & mem_reg_flush_pipe;	// @[RocketCore.scala:245:36, :267:35, :674:45, :677:19, :680:36]
    if (~ctrl_killd & _T_52)	// @[RocketCore.scala:413:26, :495:19, :500:22, :544:{23,38}, :546:26, :909:104]
      ex_reg_rs_msb_1 <= id_rs_1[63:2];	// @[RocketCore.scala:413:26, :546:38, :772:17, :1152:19, :1157:25, :1160:{31,39}]
    div_io_kill_REG <= _div_io_req_ready & _div_io_req_valid_T;	// @[Decoupled.scala:51:35, RocketCore.scala:481:19, :482:36, :673:41]
    dcache_blocked_blocked <= ~io_dmem_req_ready & ~io_dmem_perf_grant & (dcache_blocked_blocked | _io_dmem_req_valid_output | io_dmem_s2_nack);	// @[RocketCore.scala:568:45, :889:22, :890:{63,83,116}, :964:41]
    rocc_blocked <= ~wb_xcpt & (_io_rocc_cmd_valid_T & ~replay_wb_common | rocc_blocked);	// @[RocketCore.scala:356:53, :730:42, :763:48, :893:25, :894:{50,72}, :922:47, :982:53, :1104:26]
    if (ex_reg_rs_bypass_0)	// @[RocketCore.scala:411:29]
      coreMonitorBundle_rd0val_REG <= _ex_rs_T_5;	// @[RocketCore.scala:1025:46, package.scala:33:76]
    else	// @[RocketCore.scala:411:29]
      coreMonitorBundle_rd0val_REG <= _ex_rs_T_6;	// @[Cat.scala:33:92, RocketCore.scala:1025:46]
    coreMonitorBundle_rd0val_REG_1 <= coreMonitorBundle_rd0val_REG;	// @[RocketCore.scala:1025:{38,46}]
    if (ex_reg_rs_bypass_1)	// @[RocketCore.scala:411:29]
      coreMonitorBundle_rd1val_REG <= _ex_rs_T_12;	// @[RocketCore.scala:1027:46, package.scala:33:76]
    else	// @[RocketCore.scala:411:29]
      coreMonitorBundle_rd1val_REG <= _ex_rs_T_13;	// @[Cat.scala:33:92, RocketCore.scala:1027:46]
    coreMonitorBundle_rd1val_REG_1 <= coreMonitorBundle_rd1val_REG;	// @[RocketCore.scala:1027:{38,46}]
    if (reset) begin
      id_reg_fence <= 1'h0;	// @[RocketCore.scala:307:29]
      _r <= 32'h0;	// @[RocketCore.scala:1131:29]
      _id_stall_fpu_r <= 32'h0;	// @[RocketCore.scala:1131:29]
    end
    else begin
      id_reg_fence <= ~ctrl_killd & ((&_id_ctrl_decoder_decoded_T_10) | (|_id_ctrl_decoder_decoded_orMatrixOutputs_T) & _ibuf_io_inst_0_bits_inst_bits[26]) | id_mem_busy & id_reg_fence;	// @[Cat.scala:33:92, RocketCore.scala:286:20, :307:29, :347:29, :351:{37,52}, :352:38, :353:{23,38}, :495:19, :500:22, :507:{26,41}, :909:104, pla.scala:98:74, :114:39]
      if (ll_wen | _T_145)	// @[RocketCore.scala:745:27, :755:44, :760:12, :855:28, :1138:17]
        _r <= _T_143 | (_T_145 ? _id_stall_fpu_T_3 : 32'h0);	// @[RocketCore.scala:855:28, :1126:60, :1127:62, :1131:29, :1135:{49,58}]
      else if (ll_wen)	// @[RocketCore.scala:745:27, :755:44, :760:12]
        _r <= _T_143;	// @[RocketCore.scala:1127:62, :1131:29]
      if (_id_stall_fpu_T_6 | _id_stall_fpu_T_7)	// @[RocketCore.scala:880:72, :881:38, :1138:17]
        _id_stall_fpu_r <= (_id_stall_fpu_r | _id_stall_fpu_T_4) & ~(_id_stall_fpu_T_7 ? 32'h1 << io_dmem_resp_bits_tag[5:1] : 32'h0);	// @[RocketCore.scala:738:46, :881:38, :1126:60, :1127:{62,64}, :1131:29, :1135:{49,58}]
      else	// @[RocketCore.scala:1138:17]
        _id_stall_fpu_r <= {32{_id_stall_fpu_T_6}} & _id_stall_fpu_T_4 | _id_stall_fpu_r;	// @[RocketCore.scala:880:72, :1131:29, :1135:49, :1139:{18,23}]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    wire         coreMonitorBundle_wrenx = wb_wen & ~wb_set_sboard;	// @[RocketCore.scala:729:53, :764:25, :1020:{37,40}]
    wire         _T_155 = wb_ctrl_rxs1 | wb_ctrl_rfs1;	// @[RocketCore.scala:219:20, :1066:27]
    wire         _T_159 = wb_ctrl_rxs2 | wb_ctrl_rfs2;	// @[RocketCore.scala:219:20, :1068:27]
    always @(posedge clock) begin	// @[RocketCore.scala:799:11]
      if (~reset & ~(~(wb_reg_xcpt & _csr_io_htval_htval_valid_imem_T) | io_imem_gpa_valid)) begin	// @[RocketCore.scala:265:35, :797:40, :799:{11,12,30}, package.scala:16:47]
        if (`ASSERT_VERBOSE_COND_)	// @[RocketCore.scala:799:11]
          $error("Assertion failed\n    at RocketCore.scala:799 assert(!htval_valid_imem || io.imem.gpa.valid)\n");	// @[RocketCore.scala:799:11]
        if (`STOP_COND_)	// @[RocketCore.scala:799:11]
          $fatal;	// @[RocketCore.scala:799:11]
      end
      if ((`PRINTF_COND_) & _csr_io_trace_0_valid & ~reset)	// @[RocketCore.scala:315:19, :1060:13]
        $fwrite(32'h80000002, "C%d: %d [%d] pc=[%x] W[r%d=%x][%d] R[r%d=%x] R[r%d=%x] inst=[%x] DASM(%x)\n", io_hartid, _csr_io_time[31:0], _csr_io_trace_0_valid & ~_csr_io_trace_0_exception, {{30{_csr_io_trace_0_iaddr[33]}}, _csr_io_trace_0_iaddr}, wb_ctrl_wxd | wb_ctrl_wfd ? wb_reg_inst[11:7] : 5'h0, coreMonitorBundle_wrenx ? coreMonitorBundle_wrdata : 64'h0, coreMonitorBundle_wrenx, _T_155 ? wb_reg_inst[19:15] : 5'h0, _T_155 ? coreMonitorBundle_rd0val_REG_1 : 64'h0, _T_159 ? wb_reg_inst[24:20] : 5'h0, _T_159 ? coreMonitorBundle_rd1val_REG_1 : 64'h0, _csr_io_trace_0_insn, _csr_io_trace_0_insn);	// @[Bitwise.scala:77:12, Cat.scala:33:92, RocketCore.scala:219:20, :275:24, :315:19, :401:29, :767:21, :785:29, :1018:{52,55}, :1020:37, :1024:42, :1025:38, :1026:42, :1027:38, :1060:13, :1063:{13,26}, :1064:13, :1066:{13,27}, :1067:13, :1068:{13,27}, :1069:13, package.scala:124:38]
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    logic [31:0] _RANDOM_9;
    logic [31:0] _RANDOM_10;
    logic [31:0] _RANDOM_11;
    logic [31:0] _RANDOM_12;
    logic [31:0] _RANDOM_13;
    logic [31:0] _RANDOM_14;
    logic [31:0] _RANDOM_15;
    logic [31:0] _RANDOM_16;
    logic [31:0] _RANDOM_17;
    logic [31:0] _RANDOM_18;
    logic [31:0] _RANDOM_19;
    logic [31:0] _RANDOM_20;
    logic [31:0] _RANDOM_21;
    logic [31:0] _RANDOM_22;
    logic [31:0] _RANDOM_23;
    logic [31:0] _RANDOM_24;
    logic [31:0] _RANDOM_25;
    logic [31:0] _RANDOM_26;
    logic [31:0] _RANDOM_27;
    logic [31:0] _RANDOM_28;
    logic [31:0] _RANDOM_29;
    logic [31:0] _RANDOM_30;
    logic [31:0] _RANDOM_31;
    logic [31:0] _RANDOM_32;
    logic [31:0] _RANDOM_33;
    logic [31:0] _RANDOM_34;
    logic [31:0] _RANDOM_35;
    logic [31:0] _RANDOM_36;
    logic [31:0] _RANDOM_37;
    logic [31:0] _RANDOM_38;
    logic [31:0] _RANDOM_39;
    logic [31:0] _RANDOM_40;
    logic [31:0] _RANDOM_41;
    logic [31:0] _RANDOM_42;
    logic [31:0] _RANDOM_43;
    logic [31:0] _RANDOM_44;
    logic [31:0] _RANDOM_45;
    logic [31:0] _RANDOM_46;
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
        _RANDOM_6 = `RANDOM;
        _RANDOM_7 = `RANDOM;
        _RANDOM_8 = `RANDOM;
        _RANDOM_9 = `RANDOM;
        _RANDOM_10 = `RANDOM;
        _RANDOM_11 = `RANDOM;
        _RANDOM_12 = `RANDOM;
        _RANDOM_13 = `RANDOM;
        _RANDOM_14 = `RANDOM;
        _RANDOM_15 = `RANDOM;
        _RANDOM_16 = `RANDOM;
        _RANDOM_17 = `RANDOM;
        _RANDOM_18 = `RANDOM;
        _RANDOM_19 = `RANDOM;
        _RANDOM_20 = `RANDOM;
        _RANDOM_21 = `RANDOM;
        _RANDOM_22 = `RANDOM;
        _RANDOM_23 = `RANDOM;
        _RANDOM_24 = `RANDOM;
        _RANDOM_25 = `RANDOM;
        _RANDOM_26 = `RANDOM;
        _RANDOM_27 = `RANDOM;
        _RANDOM_28 = `RANDOM;
        _RANDOM_29 = `RANDOM;
        _RANDOM_30 = `RANDOM;
        _RANDOM_31 = `RANDOM;
        _RANDOM_32 = `RANDOM;
        _RANDOM_33 = `RANDOM;
        _RANDOM_34 = `RANDOM;
        _RANDOM_35 = `RANDOM;
        _RANDOM_36 = `RANDOM;
        _RANDOM_37 = `RANDOM;
        _RANDOM_38 = `RANDOM;
        _RANDOM_39 = `RANDOM;
        _RANDOM_40 = `RANDOM;
        _RANDOM_41 = `RANDOM;
        _RANDOM_42 = `RANDOM;
        _RANDOM_43 = `RANDOM;
        _RANDOM_44 = `RANDOM;
        _RANDOM_45 = `RANDOM;
        _RANDOM_46 = `RANDOM;
        id_reg_pause = _RANDOM_0[2];	// @[RocketCore.scala:129:25]
        imem_might_request_reg = _RANDOM_0[3];	// @[RocketCore.scala:129:25, :130:35]
        ex_ctrl_fp = _RANDOM_0[5];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_rocc = _RANDOM_0[6];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_branch = _RANDOM_0[7];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_jal = _RANDOM_0[8];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_jalr = _RANDOM_0[9];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_rxs2 = _RANDOM_0[10];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_rxs1 = _RANDOM_0[11];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_zbk = _RANDOM_0[13];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_zkn = _RANDOM_0[14];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_zks = _RANDOM_0[15];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_sel_alu2 = _RANDOM_0[17:16];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_sel_alu1 = _RANDOM_0[19:18];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_sel_imm = _RANDOM_0[22:20];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_alu_dw = _RANDOM_0[23];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_alu_fn = _RANDOM_0[27:24];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_mem = _RANDOM_0[28];	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_mem_cmd = {_RANDOM_0[31:29], _RANDOM_1[1:0]};	// @[RocketCore.scala:129:25, :217:20]
        ex_ctrl_rfs1 = _RANDOM_1[2];	// @[RocketCore.scala:217:20]
        ex_ctrl_rfs2 = _RANDOM_1[3];	// @[RocketCore.scala:217:20]
        ex_ctrl_wfd = _RANDOM_1[5];	// @[RocketCore.scala:217:20]
        ex_ctrl_mul = _RANDOM_1[6];	// @[RocketCore.scala:217:20]
        ex_ctrl_div = _RANDOM_1[7];	// @[RocketCore.scala:217:20]
        ex_ctrl_wxd = _RANDOM_1[8];	// @[RocketCore.scala:217:20]
        ex_ctrl_csr = _RANDOM_1[11:9];	// @[RocketCore.scala:217:20]
        ex_ctrl_fence_i = _RANDOM_1[12];	// @[RocketCore.scala:217:20]
        mem_ctrl_fp = _RANDOM_1[17];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_rocc = _RANDOM_1[18];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_branch = _RANDOM_1[19];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_jal = _RANDOM_1[20];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_jalr = _RANDOM_1[21];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_rxs2 = _RANDOM_1[22];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_rxs1 = _RANDOM_1[23];	// @[RocketCore.scala:217:20, :218:21]
        mem_ctrl_mem = _RANDOM_2[8];	// @[RocketCore.scala:218:21]
        mem_ctrl_rfs1 = _RANDOM_2[14];	// @[RocketCore.scala:218:21]
        mem_ctrl_rfs2 = _RANDOM_2[15];	// @[RocketCore.scala:218:21]
        mem_ctrl_wfd = _RANDOM_2[17];	// @[RocketCore.scala:218:21]
        mem_ctrl_mul = _RANDOM_2[18];	// @[RocketCore.scala:218:21]
        mem_ctrl_div = _RANDOM_2[19];	// @[RocketCore.scala:218:21]
        mem_ctrl_wxd = _RANDOM_2[20];	// @[RocketCore.scala:218:21]
        mem_ctrl_csr = _RANDOM_2[23:21];	// @[RocketCore.scala:218:21]
        mem_ctrl_fence_i = _RANDOM_2[24];	// @[RocketCore.scala:218:21]
        wb_ctrl_rocc = _RANDOM_2[30];	// @[RocketCore.scala:218:21, :219:20]
        wb_ctrl_rxs2 = _RANDOM_3[2];	// @[RocketCore.scala:219:20]
        wb_ctrl_rxs1 = _RANDOM_3[3];	// @[RocketCore.scala:219:20]
        wb_ctrl_mem = _RANDOM_3[20];	// @[RocketCore.scala:219:20]
        wb_ctrl_rfs1 = _RANDOM_3[26];	// @[RocketCore.scala:219:20]
        wb_ctrl_rfs2 = _RANDOM_3[27];	// @[RocketCore.scala:219:20]
        wb_ctrl_wfd = _RANDOM_3[29];	// @[RocketCore.scala:219:20]
        wb_ctrl_div = _RANDOM_3[31];	// @[RocketCore.scala:219:20]
        wb_ctrl_wxd = _RANDOM_4[0];	// @[RocketCore.scala:219:20]
        wb_ctrl_csr = _RANDOM_4[3:1];	// @[RocketCore.scala:219:20]
        wb_ctrl_fence_i = _RANDOM_4[4];	// @[RocketCore.scala:219:20]
        ex_reg_xcpt_interrupt = _RANDOM_4[8];	// @[RocketCore.scala:219:20, :221:35]
        ex_reg_valid = _RANDOM_4[9];	// @[RocketCore.scala:219:20, :222:35]
        ex_reg_rvc = _RANDOM_4[10];	// @[RocketCore.scala:219:20, :223:35]
        ex_reg_xcpt = _RANDOM_5[28];	// @[RocketCore.scala:225:35]
        ex_reg_flush_pipe = _RANDOM_5[29];	// @[RocketCore.scala:225:35, :226:35]
        ex_reg_load_use = _RANDOM_5[30];	// @[RocketCore.scala:225:35, :227:35]
        ex_reg_cause = {_RANDOM_5[31], _RANDOM_6, _RANDOM_7[30:0]};	// @[RocketCore.scala:225:35, :228:35]
        ex_reg_replay = _RANDOM_7[31];	// @[RocketCore.scala:228:35, :229:26]
        ex_reg_pc = {_RANDOM_8, _RANDOM_9[1:0]};	// @[RocketCore.scala:230:22]
        ex_reg_mem_size = _RANDOM_9[3:2];	// @[RocketCore.scala:230:22, :231:28]
        ex_reg_hls = _RANDOM_9[4];	// @[RocketCore.scala:230:22, :232:23]
        ex_reg_inst = {_RANDOM_9[31:5], _RANDOM_10[4:0]};	// @[RocketCore.scala:230:22, :233:24]
        ex_reg_raw_inst = {_RANDOM_10[31:5], _RANDOM_11[4:0]};	// @[RocketCore.scala:233:24, :234:28]
        ex_scie_unpipelined = _RANDOM_11[5];	// @[RocketCore.scala:234:28, :235:32]
        ex_scie_pipelined = _RANDOM_11[6];	// @[RocketCore.scala:234:28, :236:30]
        mem_reg_xcpt_interrupt = _RANDOM_11[8];	// @[RocketCore.scala:234:28, :239:36]
        mem_reg_valid = _RANDOM_11[9];	// @[RocketCore.scala:234:28, :240:36]
        mem_reg_rvc = _RANDOM_11[10];	// @[RocketCore.scala:234:28, :241:36]
        mem_reg_xcpt = _RANDOM_12[28];	// @[RocketCore.scala:243:36]
        mem_reg_replay = _RANDOM_12[29];	// @[RocketCore.scala:243:36, :244:36]
        mem_reg_flush_pipe = _RANDOM_12[30];	// @[RocketCore.scala:243:36, :245:36]
        mem_reg_cause = {_RANDOM_12[31], _RANDOM_13, _RANDOM_14[30:0]};	// @[RocketCore.scala:243:36, :246:36]
        mem_reg_slow_bypass = _RANDOM_14[31];	// @[RocketCore.scala:246:36, :247:36]
        mem_reg_load = _RANDOM_15[0];	// @[RocketCore.scala:248:36]
        mem_reg_store = _RANDOM_15[1];	// @[RocketCore.scala:248:36, :249:36]
        mem_reg_sfence = _RANDOM_15[2];	// @[RocketCore.scala:248:36, :250:27]
        mem_reg_pc = {_RANDOM_15[31:3], _RANDOM_16[4:0]};	// @[RocketCore.scala:248:36, :251:23]
        mem_reg_inst = {_RANDOM_16[31:5], _RANDOM_17[4:0]};	// @[RocketCore.scala:251:23, :252:25]
        mem_reg_hls_or_dv = _RANDOM_17[7];	// @[RocketCore.scala:252:25, :254:30]
        mem_reg_raw_inst = {_RANDOM_17[31:8], _RANDOM_18[7:0]};	// @[RocketCore.scala:252:25, :255:29]
        mem_scie_pipelined = _RANDOM_18[9];	// @[RocketCore.scala:255:29, :257:31]
        mem_reg_wdata = {_RANDOM_18[31:10], _RANDOM_19, _RANDOM_20[9:0]};	// @[RocketCore.scala:255:29, :258:26]
        mem_reg_rs2 = {_RANDOM_20[31:10], _RANDOM_21, _RANDOM_22[9:0]};	// @[RocketCore.scala:258:26, :259:24]
        mem_br_taken = _RANDOM_22[10];	// @[RocketCore.scala:259:24, :260:25]
        wb_reg_valid = _RANDOM_22[12];	// @[RocketCore.scala:259:24, :264:35]
        wb_reg_xcpt = _RANDOM_22[13];	// @[RocketCore.scala:259:24, :265:35]
        wb_reg_replay = _RANDOM_22[14];	// @[RocketCore.scala:259:24, :266:35]
        wb_reg_flush_pipe = _RANDOM_22[15];	// @[RocketCore.scala:259:24, :267:35]
        wb_reg_cause = {_RANDOM_22[31:16], _RANDOM_23, _RANDOM_24[15:0]};	// @[RocketCore.scala:259:24, :268:35]
        wb_reg_sfence = _RANDOM_24[16];	// @[RocketCore.scala:268:35, :269:26]
        wb_reg_pc = {_RANDOM_24[31:17], _RANDOM_25[18:0]};	// @[RocketCore.scala:268:35, :270:22]
        wb_reg_hls_or_dv = _RANDOM_25[21];	// @[RocketCore.scala:270:22, :272:29]
        wb_reg_inst = {_RANDOM_25[31:24], _RANDOM_26[23:0]};	// @[RocketCore.scala:270:22, :275:24]
        wb_reg_raw_inst = {_RANDOM_26[31:24], _RANDOM_27[23:0]};	// @[RocketCore.scala:275:24, :276:28]
        wb_reg_wdata = {_RANDOM_27[31:24], _RANDOM_28, _RANDOM_29[23:0]};	// @[RocketCore.scala:276:28, :277:25]
        id_reg_fence = _RANDOM_31[25];	// @[RocketCore.scala:307:29]
        ex_reg_rs_bypass_0 = _RANDOM_31[26];	// @[RocketCore.scala:307:29, :411:29]
        ex_reg_rs_bypass_1 = _RANDOM_31[27];	// @[RocketCore.scala:307:29, :411:29]
        ex_reg_rs_lsb_0 = _RANDOM_31[29:28];	// @[RocketCore.scala:307:29, :412:26]
        ex_reg_rs_lsb_1 = _RANDOM_31[31:30];	// @[RocketCore.scala:307:29, :412:26]
        ex_reg_rs_msb_0 = {_RANDOM_32, _RANDOM_33[29:0]};	// @[RocketCore.scala:413:26]
        ex_reg_rs_msb_1 = {_RANDOM_33[31:30], _RANDOM_34, _RANDOM_35[27:0]};	// @[RocketCore.scala:413:26]
        div_io_kill_REG = _RANDOM_35[28];	// @[RocketCore.scala:413:26, :673:41]
        _r = {_RANDOM_35[31:29], _RANDOM_36[28:0]};	// @[RocketCore.scala:413:26, :1131:29]
        _id_stall_fpu_r = {_RANDOM_36[31:29], _RANDOM_37[28:0]};	// @[RocketCore.scala:1131:29]
        dcache_blocked_blocked = _RANDOM_37[29];	// @[RocketCore.scala:889:22, :1131:29]
        rocc_blocked = _RANDOM_37[30];	// @[RocketCore.scala:893:25, :1131:29]
        coreMonitorBundle_rd0val_REG = {_RANDOM_38[31:1], _RANDOM_39, _RANDOM_40[0]};	// @[RocketCore.scala:1025:46]
        coreMonitorBundle_rd0val_REG_1 = {_RANDOM_40[31:1], _RANDOM_41, _RANDOM_42[0]};	// @[RocketCore.scala:1025:{38,46}]
        coreMonitorBundle_rd1val_REG = {_RANDOM_42[31:1], _RANDOM_43, _RANDOM_44[0]};	// @[RocketCore.scala:1025:38, :1027:46]
        coreMonitorBundle_rd1val_REG_1 = {_RANDOM_44[31:1], _RANDOM_45, _RANDOM_46[0]};	// @[RocketCore.scala:1027:{38,46}]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  IBuf ibuf (	// @[RocketCore.scala:286:20]
    .clock                        (clock),
    .reset                        (reset),
    .io_imem_valid                (io_imem_resp_valid),
    .io_imem_bits_btb_taken       (io_imem_resp_bits_btb_taken),
    .io_imem_bits_btb_bridx       (io_imem_resp_bits_btb_bridx),
    .io_imem_bits_pc              (io_imem_resp_bits_pc),
    .io_imem_bits_data            (io_imem_resp_bits_data),
    .io_imem_bits_xcpt_pf_inst    (io_imem_resp_bits_xcpt_pf_inst),
    .io_imem_bits_xcpt_gf_inst    (io_imem_resp_bits_xcpt_gf_inst),
    .io_imem_bits_xcpt_ae_inst    (io_imem_resp_bits_xcpt_ae_inst),
    .io_imem_bits_replay          (io_imem_resp_bits_replay),
    .io_kill                      (take_pc_mem_wb),	// @[RocketCore.scala:282:35]
    .io_inst_0_ready              (~_ctrl_stalld_T_28),	// @[RocketCore.scala:906:22, :932:28]
    .io_imem_ready                (io_imem_resp_ready),
    .io_pc                        (_ibuf_io_pc),
    .io_inst_0_valid              (_ibuf_io_inst_0_valid),
    .io_inst_0_bits_xcpt0_pf_inst (_ibuf_io_inst_0_bits_xcpt0_pf_inst),
    .io_inst_0_bits_xcpt0_gf_inst (_ibuf_io_inst_0_bits_xcpt0_gf_inst),
    .io_inst_0_bits_xcpt0_ae_inst (_ibuf_io_inst_0_bits_xcpt0_ae_inst),
    .io_inst_0_bits_xcpt1_pf_inst (_ibuf_io_inst_0_bits_xcpt1_pf_inst),
    .io_inst_0_bits_xcpt1_gf_inst (_ibuf_io_inst_0_bits_xcpt1_gf_inst),
    .io_inst_0_bits_xcpt1_ae_inst (_ibuf_io_inst_0_bits_xcpt1_ae_inst),
    .io_inst_0_bits_replay        (_ibuf_io_inst_0_bits_replay),
    .io_inst_0_bits_rvc           (_ibuf_io_inst_0_bits_rvc),
    .io_inst_0_bits_inst_bits     (_ibuf_io_inst_0_bits_inst_bits),
    .io_inst_0_bits_inst_rd       (_ibuf_io_inst_0_bits_inst_rd),
    .io_inst_0_bits_inst_rs1      (_ibuf_io_inst_0_bits_inst_rs1),
    .io_inst_0_bits_inst_rs2      (_ibuf_io_inst_0_bits_inst_rs2),
    .io_inst_0_bits_inst_rs3      (_ibuf_io_inst_0_bits_inst_rs3),
    .io_inst_0_bits_raw           (_ibuf_io_inst_0_bits_raw)
  );
  rf_combMem rf_ext (	// @[RocketCore.scala:1145:15]
    .R0_addr (~_ibuf_io_inst_0_bits_inst_rs1),	// @[RocketCore.scala:286:20, :1146:39]
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R1_addr (~_ibuf_io_inst_0_bits_inst_rs2),	// @[RocketCore.scala:286:20, :1146:39]
    .R1_en   (1'h1),
    .R1_clk  (clock),
    .W0_addr (~rf_waddr),	// @[RocketCore.scala:766:21, :1146:39]
    .W0_en   (rf_wen & (|rf_waddr)),	// @[RocketCore.scala:765:23, :766:21, :772:17, :1145:15, :1157:{16,25}]
    .W0_clk  (clock),
    .W0_data (coreMonitorBundle_wrdata),	// @[RocketCore.scala:767:21]
    .R0_data (_rf_ext_R0_data),
    .R1_data (_rf_ext_R1_data)
  );
  CSRFile csr (	// @[RocketCore.scala:315:19]
    .clock                      (clock),
    .reset                      (reset),
    .io_ungated_clock           (clock),
    .io_interrupts_debug        (io_interrupts_debug),
    .io_interrupts_mtip         (io_interrupts_mtip),
    .io_interrupts_msip         (io_interrupts_msip),
    .io_interrupts_meip         (io_interrupts_meip),
    .io_hartid                  (io_hartid),
    .io_rw_addr                 (wb_reg_inst[31:20]),	// @[RocketCore.scala:275:24, :814:32]
    .io_rw_cmd                  (wb_ctrl_csr & {wb_reg_valid, 2'h3}),	// @[CSR.scala:168:{9,15}, RocketCore.scala:219:20, :264:35]
    .io_rw_wdata                (wb_reg_wdata),	// @[RocketCore.scala:277:25]
    .io_decode_0_inst           (_ibuf_io_inst_0_bits_inst_bits),	// @[RocketCore.scala:286:20]
    .io_exception               (wb_xcpt),	// @[RocketCore.scala:1104:26]
    .io_retire                  (wb_valid),	// @[RocketCore.scala:763:45]
    .io_cause                   (wb_reg_xcpt ? wb_reg_cause : {59'h0, _T_91 ? 5'hF : _T_93 ? 5'hD : _T_95 ? 5'h17 : _T_97 ? 5'h15 : {2'h0, _T_99 ? 3'h7 : _T_101 ? 3'h5 : {1'h1, _T_103, 1'h0}}}),	// @[Mux.scala:47:70, RocketCore.scala:265:35, :268:35, :703:34, :704:34, :705:34, :706:34, :707:34, :708:34, :709:34, :1167:24, package.scala:16:47]
    .io_pc                      (wb_reg_pc),	// @[RocketCore.scala:270:22]
    .io_tval                    (wb_xcpt & (~wb_reg_xcpt | wb_reg_cause == 64'h3 | wb_reg_cause == 64'h1 | wb_reg_cause == 64'hC | _csr_io_htval_htval_valid_imem_T | wb_reg_cause == 64'h2) ? {wb_reg_wdata[63:33] == 31'h0 | (&(wb_reg_wdata[63:33])) ? wb_reg_wdata[33] : ~(wb_reg_wdata[32]), wb_reg_wdata[32:0]} : 34'h0),	// @[Cat.scala:33:92, RocketCore.scala:265:35, :268:35, :277:25, :789:24, :792:32, :793:{28,46}, :795:21, :1104:26, :1119:17, :1120:{18,21,29,34,46,51,54}, :1121:16, package.scala:16:47]
    .io_gva                     (wb_xcpt & ~wb_reg_xcpt & wb_reg_hls_or_dv),	// @[RocketCore.scala:265:35, :272:29, :789:24, :794:25, :1104:26]
    .io_fcsr_flags_valid        (io_fpu_fcsr_flags_valid),
    .io_fcsr_flags_bits         (io_fpu_fcsr_flags_bits),
    .io_inst_0                  ({(&(wb_reg_raw_inst[1:0])) ? wb_reg_inst[31:16] : 16'h0, wb_reg_raw_inst[15:0]}),	// @[Cat.scala:33:92, RocketCore.scala:275:24, :276:28, :780:{50,66,73,91,119}]
    .io_rw_rdata                (_csr_io_rw_rdata),
    .io_decode_0_fp_illegal     (_csr_io_decode_0_fp_illegal),
    .io_decode_0_fp_csr         (_csr_io_decode_0_fp_csr),
    .io_decode_0_read_illegal   (_csr_io_decode_0_read_illegal),
    .io_decode_0_write_illegal  (_csr_io_decode_0_write_illegal),
    .io_decode_0_write_flush    (_csr_io_decode_0_write_flush),
    .io_decode_0_system_illegal (_csr_io_decode_0_system_illegal),
    .io_csr_stall               (_csr_io_csr_stall),
    .io_eret                    (_csr_io_eret),
    .io_singleStep              (_csr_io_singleStep),
    .io_status_debug            (_csr_io_status_debug),
    .io_status_wfi              (io_wfi),
    .io_status_isa              (_csr_io_status_isa),
    .io_evec                    (_csr_io_evec),
    .io_time                    (_csr_io_time),
    .io_fcsr_rm                 (io_fpu_fcsr_rm),
    .io_interrupt               (_csr_io_interrupt),
    .io_interrupt_cause         (_csr_io_interrupt_cause),
    .io_bp_0_control_action     (_csr_io_bp_0_control_action),
    .io_bp_0_control_chain      (_csr_io_bp_0_control_chain),
    .io_bp_0_control_tmatch     (_csr_io_bp_0_control_tmatch),
    .io_bp_0_control_x          (_csr_io_bp_0_control_x),
    .io_bp_0_control_w          (_csr_io_bp_0_control_w),
    .io_bp_0_control_r          (_csr_io_bp_0_control_r),
    .io_bp_0_address            (_csr_io_bp_0_address),
    .io_pmp_0_cfg_l             (io_ptw_pmp_0_cfg_l),
    .io_pmp_0_cfg_a             (io_ptw_pmp_0_cfg_a),
    .io_pmp_0_cfg_x             (io_ptw_pmp_0_cfg_x),
    .io_pmp_0_cfg_w             (io_ptw_pmp_0_cfg_w),
    .io_pmp_0_cfg_r             (io_ptw_pmp_0_cfg_r),
    .io_pmp_0_addr              (io_ptw_pmp_0_addr),
    .io_pmp_0_mask              (io_ptw_pmp_0_mask),
    .io_pmp_1_cfg_l             (io_ptw_pmp_1_cfg_l),
    .io_pmp_1_cfg_a             (io_ptw_pmp_1_cfg_a),
    .io_pmp_1_cfg_x             (io_ptw_pmp_1_cfg_x),
    .io_pmp_1_cfg_w             (io_ptw_pmp_1_cfg_w),
    .io_pmp_1_cfg_r             (io_ptw_pmp_1_cfg_r),
    .io_pmp_1_addr              (io_ptw_pmp_1_addr),
    .io_pmp_1_mask              (io_ptw_pmp_1_mask),
    .io_pmp_2_cfg_l             (io_ptw_pmp_2_cfg_l),
    .io_pmp_2_cfg_a             (io_ptw_pmp_2_cfg_a),
    .io_pmp_2_cfg_x             (io_ptw_pmp_2_cfg_x),
    .io_pmp_2_cfg_w             (io_ptw_pmp_2_cfg_w),
    .io_pmp_2_cfg_r             (io_ptw_pmp_2_cfg_r),
    .io_pmp_2_addr              (io_ptw_pmp_2_addr),
    .io_pmp_2_mask              (io_ptw_pmp_2_mask),
    .io_pmp_3_cfg_l             (io_ptw_pmp_3_cfg_l),
    .io_pmp_3_cfg_a             (io_ptw_pmp_3_cfg_a),
    .io_pmp_3_cfg_x             (io_ptw_pmp_3_cfg_x),
    .io_pmp_3_cfg_w             (io_ptw_pmp_3_cfg_w),
    .io_pmp_3_cfg_r             (io_ptw_pmp_3_cfg_r),
    .io_pmp_3_addr              (io_ptw_pmp_3_addr),
    .io_pmp_3_mask              (io_ptw_pmp_3_mask),
    .io_pmp_4_cfg_l             (io_ptw_pmp_4_cfg_l),
    .io_pmp_4_cfg_a             (io_ptw_pmp_4_cfg_a),
    .io_pmp_4_cfg_x             (io_ptw_pmp_4_cfg_x),
    .io_pmp_4_cfg_w             (io_ptw_pmp_4_cfg_w),
    .io_pmp_4_cfg_r             (io_ptw_pmp_4_cfg_r),
    .io_pmp_4_addr              (io_ptw_pmp_4_addr),
    .io_pmp_4_mask              (io_ptw_pmp_4_mask),
    .io_pmp_5_cfg_l             (io_ptw_pmp_5_cfg_l),
    .io_pmp_5_cfg_a             (io_ptw_pmp_5_cfg_a),
    .io_pmp_5_cfg_x             (io_ptw_pmp_5_cfg_x),
    .io_pmp_5_cfg_w             (io_ptw_pmp_5_cfg_w),
    .io_pmp_5_cfg_r             (io_ptw_pmp_5_cfg_r),
    .io_pmp_5_addr              (io_ptw_pmp_5_addr),
    .io_pmp_5_mask              (io_ptw_pmp_5_mask),
    .io_pmp_6_cfg_l             (io_ptw_pmp_6_cfg_l),
    .io_pmp_6_cfg_a             (io_ptw_pmp_6_cfg_a),
    .io_pmp_6_cfg_x             (io_ptw_pmp_6_cfg_x),
    .io_pmp_6_cfg_w             (io_ptw_pmp_6_cfg_w),
    .io_pmp_6_cfg_r             (io_ptw_pmp_6_cfg_r),
    .io_pmp_6_addr              (io_ptw_pmp_6_addr),
    .io_pmp_6_mask              (io_ptw_pmp_6_mask),
    .io_pmp_7_cfg_l             (io_ptw_pmp_7_cfg_l),
    .io_pmp_7_cfg_a             (io_ptw_pmp_7_cfg_a),
    .io_pmp_7_cfg_x             (io_ptw_pmp_7_cfg_x),
    .io_pmp_7_cfg_w             (io_ptw_pmp_7_cfg_w),
    .io_pmp_7_cfg_r             (io_ptw_pmp_7_cfg_r),
    .io_pmp_7_addr              (io_ptw_pmp_7_addr),
    .io_pmp_7_mask              (io_ptw_pmp_7_mask),
    .io_inhibit_cycle           (_csr_io_inhibit_cycle),
    .io_trace_0_valid           (_csr_io_trace_0_valid),
    .io_trace_0_iaddr           (_csr_io_trace_0_iaddr),
    .io_trace_0_insn            (_csr_io_trace_0_insn),
    .io_trace_0_exception       (_csr_io_trace_0_exception),
    .io_customCSRs_0_value      (_csr_io_customCSRs_0_value)
  );
  BreakpointUnit bpu (	// @[RocketCore.scala:360:19]
    .io_status_debug        (_csr_io_status_debug),	// @[RocketCore.scala:315:19]
    .io_bp_0_control_action (_csr_io_bp_0_control_action),	// @[RocketCore.scala:315:19]
    .io_bp_0_control_chain  (_csr_io_bp_0_control_chain),	// @[RocketCore.scala:315:19]
    .io_bp_0_control_tmatch (_csr_io_bp_0_control_tmatch),	// @[RocketCore.scala:315:19]
    .io_bp_0_control_x      (_csr_io_bp_0_control_x),	// @[RocketCore.scala:315:19]
    .io_bp_0_control_w      (_csr_io_bp_0_control_w),	// @[RocketCore.scala:315:19]
    .io_bp_0_control_r      (_csr_io_bp_0_control_r),	// @[RocketCore.scala:315:19]
    .io_bp_0_address        (_csr_io_bp_0_address),	// @[RocketCore.scala:315:19]
    .io_pc                  (_ibuf_io_pc[32:0]),	// @[RocketCore.scala:286:20, :363:13]
    .io_ea                  (mem_reg_wdata[32:0]),	// @[RocketCore.scala:258:26, :364:13]
    .io_xcpt_if             (_bpu_io_xcpt_if),
    .io_xcpt_ld             (_bpu_io_xcpt_ld),
    .io_xcpt_st             (_bpu_io_xcpt_st),
    .io_debug_if            (_bpu_io_debug_if),
    .io_debug_ld            (_bpu_io_debug_ld),
    .io_debug_st            (_bpu_io_debug_st)
  );
  ALU alu (	// @[RocketCore.scala:425:19]
    .io_dw        (ex_ctrl_alu_dw),	// @[RocketCore.scala:217:20]
    .io_fn        (ex_ctrl_alu_fn),	// @[RocketCore.scala:217:20]
    .io_in2       (_GEN_2[ex_ctrl_sel_alu2]),	// @[Mux.scala:81:{58,61}, RocketCore.scala:217:20]
    .io_in1       (ex_ctrl_sel_alu1 == 2'h2 ? {{30{ex_reg_pc[33]}}, ex_reg_pc} : ex_ctrl_sel_alu1 == 2'h1 ? ex_rs_0 : 64'h0),	// @[Mux.scala:47:70, :81:{58,61}, RocketCore.scala:217:20, :230:22, :415:14]
    .io_out       (_alu_io_out),
    .io_adder_out (_alu_io_adder_out),
    .io_cmp_out   (_alu_io_cmp_out)
  );
  MulDiv div (	// @[RocketCore.scala:481:19]
    .clock             (clock),
    .reset             (reset),
    .io_req_valid      (_div_io_req_valid_T),	// @[RocketCore.scala:482:36]
    .io_req_bits_fn    (ex_ctrl_alu_fn),	// @[RocketCore.scala:217:20]
    .io_req_bits_dw    (ex_ctrl_alu_dw),	// @[RocketCore.scala:217:20]
    .io_req_bits_in1   (ex_rs_0),	// @[RocketCore.scala:415:14]
    .io_req_bits_in2   (ex_rs_1),	// @[RocketCore.scala:415:14]
    .io_req_bits_tag   (ex_reg_inst[11:7]),	// @[RocketCore.scala:233:24, :399:29]
    .io_kill           (killm_common & div_io_kill_REG),	// @[RocketCore.scala:672:68, :673:{31,41}]
    .io_resp_ready     (_GEN),	// @[RocketCore.scala:742:21, :755:44, :756:23]
    .io_req_ready      (_div_io_req_ready),
    .io_resp_valid     (_div_io_resp_valid),
    .io_resp_bits_data (_div_io_resp_bits_data),
    .io_resp_bits_tag  (_div_io_resp_bits_tag)
  );
  assign io_imem_might_request = imem_might_request_reg;	// @[RocketCore.scala:130:35]
  assign io_imem_req_valid = take_pc_mem_wb;	// @[RocketCore.scala:282:35]
  assign io_imem_req_bits_pc = wb_xcpt | _csr_io_eret ? _csr_io_evec : replay_wb ? wb_reg_pc : _mem_npc_T_5;	// @[RocketCore.scala:270:22, :315:19, :589:129, :732:36, :914:{8,17}, :915:8, :1104:26]
  assign io_imem_req_bits_speculative = ~take_pc_wb;	// @[RocketCore.scala:678:34, :733:53]
  assign io_imem_sfence_valid = wb_reg_valid & wb_reg_sfence;	// @[RocketCore.scala:264:35, :269:26, :923:40]
  assign io_imem_btb_update_valid = mem_reg_valid & ~take_pc_wb & (ex_pc_valid ? _mem_npc_T_5 != ex_reg_pc : ~(_ibuf_io_inst_0_valid | io_imem_resp_valid) | _mem_npc_T_5 != _ibuf_io_pc) & (~(mem_ctrl_branch | mem_ctrl_jalr | mem_ctrl_jal) | mem_cfi_taken);	// @[RocketCore.scala:218:21, :230:22, :240:36, :286:20, :566:51, :589:129, :591:{8,30}, :592:{8,31,62}, :595:50, :596:74, :678:34, :733:53, :934:{77,81,90}]
  assign io_imem_bht_update_valid = mem_reg_valid & ~take_pc_wb;	// @[RocketCore.scala:240:36, :678:34, :733:53, :946:45]
  assign io_imem_flush_icache = wb_reg_valid & wb_ctrl_fence_i & ~io_dmem_s2_nack;	// @[RocketCore.scala:219:20, :264:35, :917:{59,62}]
  assign io_dmem_req_valid = _io_dmem_req_valid_output;	// @[RocketCore.scala:964:41]
  assign io_dmem_req_bits_addr = {ex_rs_0[63:33] == 31'h0 | (&(ex_rs_0[63:33])) ? _alu_io_adder_out[33] : ~(_alu_io_adder_out[32]), _alu_io_adder_out[32:0]};	// @[Cat.scala:33:92, RocketCore.scala:415:14, :425:19, :1119:17, :1120:{18,21,29,34,46,51,54}, :1121:16]
  assign io_dmem_req_bits_tag = {1'h0, ex_reg_inst[11:7], ex_ctrl_fp};	// @[RocketCore.scala:217:20, :233:24, :399:29, :967:25]
  assign io_dmem_req_bits_cmd = ex_ctrl_mem_cmd;	// @[RocketCore.scala:217:20]
  assign io_dmem_req_bits_size = ex_reg_mem_size;	// @[RocketCore.scala:231:28]
  assign io_dmem_req_bits_signed = ~(ex_reg_hls ? ex_reg_inst[20] : ex_reg_inst[14]);	// @[RocketCore.scala:232:23, :233:24, :970:{30,34,75}, :1171:39]
  assign io_dmem_req_bits_dprv = ex_reg_hls ? 2'h0 : 2'h3;	// @[RocketCore.scala:232:23, :974:31]
  assign io_dmem_req_bits_dv = ex_reg_hls;	// @[RocketCore.scala:232:23]
  assign io_dmem_s1_kill = killm_common | mem_ldst_xcpt | fpu_kill_mem;	// @[RocketCore.scala:670:51, :672:68, :977:52, :1104:26]
  assign io_dmem_s1_data_data = mem_ctrl_fp ? {2{io_fpu_store_data}} : mem_reg_rs2;	// @[Cat.scala:33:92, RocketCore.scala:218:21, :259:24, :976:63]
  assign io_ptw_status_debug = _csr_io_status_debug;	// @[RocketCore.scala:315:19]
  assign io_ptw_customCSRs_csrs_0_value = _csr_io_customCSRs_0_value;	// @[RocketCore.scala:315:19]
  assign io_fpu_inst = _ibuf_io_inst_0_bits_inst_bits;	// @[RocketCore.scala:286:20]
  assign io_fpu_fromint_data = ex_rs_0;	// @[RocketCore.scala:415:14]
  assign io_fpu_dmem_resp_val = dmem_resp_valid & io_dmem_resp_bits_tag[0];	// @[RocketCore.scala:736:45, :739:44, :958:43]
  assign io_fpu_dmem_resp_tag = io_dmem_resp_bits_tag[5:1];	// @[RocketCore.scala:738:46]
  assign io_fpu_dmem_resp_data = io_dmem_resp_bits_data_word_bypass[31:0];	// @[RocketCore.scala:959:25]
  assign io_fpu_valid = ~ctrl_killd & (|_id_ctrl_decoder_decoded_orMatrixOutputs_T_60);	// @[Cat.scala:33:92, RocketCore.scala:495:19, :909:104, :953:31, pla.scala:114:39]
  assign io_fpu_killx = ctrl_killx;	// @[RocketCore.scala:572:48]
  assign io_fpu_killm = killm_common;	// @[RocketCore.scala:672:68]
endmodule

