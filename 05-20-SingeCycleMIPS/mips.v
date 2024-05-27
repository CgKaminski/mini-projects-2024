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


/*
 * TODO -- Data Path
 */ 
module DATAPATH(
  input wire i_clk_w,
  input wire i_rst_w,
  input wire i_mem_to_reg_w,  
  input wire i_pc_src_w,
  input wire i_alu_src_w,
  input wire i_reg_dst_w,
  input wire i_reg_write_w,
  input wire i_jump_w,
  input wire [2:0] i_alu_control_w,
  output wire o_zero_w,
  output wire [31:0] o_pc_w,
  output wire [31:0] o_instr_w,
  output wire [31:0] o_alu_out_w,
  output wire [31:0] o_write_data_w,
  output wire [31:0] o_read_data_w,
  );

  // TODO -- Write Data Path here
endmodule


/*
 * TODO -- ALU
 */
module ALU(
  input wire [31:0] i_a_w,
  input wire [31:0] i_b_w,
  input wire [2:0] i_alu_control_w,
  output wire [31:0] o_alu_out_w,
  output wire o_zero_w
  );

  wire [31:0] cond_inv_b_w;
  wire [31:0] sum_w;

  assign cond_inv_b_w = i_alu_control_w[2] ? ~i_b_w : i_b_w;
  assign sum_w = i_a_w + cond_inv_b_w + i_alu_control_w[2];

  always @* begin
    case(i_alu_control_w[1:0])
      2'b00: o_alu_out_w = i_a_w & i_b_w;
      2'b01: o_alu_out_w = i_a_w | i_b_w;
      2'b10: o_alu_out_w = sum_w;
      2'b11: o_alu_out_w = sum[31];
    endcase 
  end

  assign o_zero_w = (o_alu_out_w == 32'b0);
endmodule


/*
 * TODO -- Adder Module
 */
module ADDER(
  input wire [31:0] i_a_w,
  input wire [31:0] i_b_w,
  output wire [31:0] o_sum_w
  );

  assign o_sum_w = i_a_w + i_b_w;
endmodule


/*
 * TODO Left Shifter by 2
 */
module SHIFTER(
  input wire [31:0] i_a_w,
  output wire [31:0] o_shifted_w
  );

  assign o_shifted_w = i_a_w << 2;
endmodule


/*
 * TODO -- Sign Extender
 */
module SIGNEXTENDER(
  input wire [15:0] i_a_w,
  output wire [31:0] o_extended_w
  );

  assign o_extended_w = {{16{i_a_w[15]}}, i_a_w};
endmodule


/*
 * TODO -- Flop Module
 */
module FLOP #(parameter WIDTH = 8)(
  input wire i_clk_w,
  input wire i_rst_w,
  input wire i_d_w,
  output wire o_q_w
  );

  always @(posedge i_clk_w or posedge i_rst_w)
    if (i_rst_w)
      o_q_w <= 0;
    else
      o_q_w <= i_d_w;
endmodule


/*
 * TODO -- Mux Module
 */
module MUX #(parameter WIDTH = 8) (
  input wire i_s_w,
  input wire [WIDTH-1:0] i_a_w,
  input wire [WIDTH-1:0] i_b_w,
  output wire [WIDTH-1:0] o_y_w
  );

  assign o_y_w = i_s_w ? i_b_w : i_a_w;
endmodule

