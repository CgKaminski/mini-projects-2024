module TOP(
  input wire i_clk_w,
  input wire i_rst_w,
  output wire [31:0] o_write_data_w,
  output wire [31:0] 0_data_addr_w,
  output wire o_mem_write_w
);

  // TODO -- Add MIPS module here
  // TODO -- Add Instruction Memory module here
  // TODO -- Add Data Memory module here

endmodule


/*
 * TODO -- MIPS Processor
 */
module MIPS(
  input wire i_clk,
  input wire i_rst_w,
  input wire [31:0] i_instr_w
  input wire [31:0] i_read_data_w,
  output wire o_mem_write_w,
  output wire [31:0] o_pc_w,
  output wire [31:0] o_alu_out_w,
  output wire [31:0] o_write_data_w,
);

  // TODO -- Write MIPS Processor here
endmodule 


/*
 * TODO -- Instruction Memory
 */
module IMEM(
  input wire [5:0] i_a_w,
  output wire [31:0] o_rd_w
  );

  // TODO -- Write Instruction Memory here
endmodule


/*
 * TODO -- Data Memory
 */
module DMEM(
  input wire i_clk_w,
  input wire i_we_w,
  input wire [31:0] i_a_w,
  input wire [31:0] i_wd_w,)
  output wire [31:0] o_rd_w
  );

  // TODO -- Write Data Memory here
endmodule


/*
 * TODO -- Controller
 */
module CONTROLLER(
  input wire i_zero_w,
  input wire [5:0] i_op_w,
  input wire [5:0] i_funct_w,
  output wire o_mem_to_reg_w,
  output wire o_mem_write_w,
  output wire o_pc_src_w,
  output wire o_alu_src_w,
  output wire o_reg_write_w,
  output wire o_reg_dst_w,
  output wire o_jump_w,
  output wire [2:0] o_alu_control_w
  );

  // TODO -- Write Controller here
endmodule


/*
 * TODO -- Main Decoder
 */
module MAINDECODER(
  input wire [5:0] i_op_w,
  output wire o_mem_to_reg_w,
  output wire o_mem_write_w,
  output wire o_branch_w,
  output wire 0_alu_src_w,
  output wire o_reg_dst_w,
  output wire o_reg_write_w
  output wire o_jump_w,
  output wire [1:0] o_alu_op_w
  );

  // TODO -- Write Main Decoder here
endmodule


/*
 * TODO -- ALU Deconder
 */
module ALUDECODER(
  input wire [5:0] i_funct_w,
  input wire [1:0] i_alu_op_w,
  output wire [2:0] o_alu_control_w
  );

  // TODO -- Write ALU Decoder here
endmodule

