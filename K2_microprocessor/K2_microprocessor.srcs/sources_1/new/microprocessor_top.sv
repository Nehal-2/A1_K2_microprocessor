`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 04:07:30 PM
// Design Name: 
// Module Name: microprocessor_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module microprocessor_top#(
        //parameter INST_WIDTH = 8,
        //parameter INST_DEPTH = 16,
        parameter DATA_WIDTH = 8
        
)(
        input logic clk,
        input logic reset_n,
        input logic en,
        output logic [3:0] prog_count,
        output logic [DATA_WIDTH-1:0] A, B, Out

    );
    
    localparam INST_WIDTH = 8;
    localparam INST_DEPTH = 16;
    //localparam DATA_WIDTH = 8;
    
    logic [INST_WIDTH-1:0] inst;
    logic J, C, D1, D0, Sreg, S;
    logic [2:0] imm;
    
    // INSTRUCTION MEMORY
    
    instruction_memory inst_memory (
        .address(prog_count),
        .instruction(inst)
    );
         
     // INSTRUCTION DECODER
     
     inst_decoder#(.n(INST_WIDTH)) inst_decoder(
        .inst(inst),
        .J(J),
        .C(C),
        .D1(D1),
        .D0(D0),
        .Sreg(Sreg),
        .S(S),
        .imm(imm)
    );
    
    logic [3:0] imm_ext;
    assign imm_ext = {1'b0, imm}; // Extended version of imm to input to the program counter
    
    // PROGRAM COUNTER
    
    //logic prog_count;
 
    mod_n_counter#(.N(16)) PC (
        .clk(clk),
        .areset(reset_n),
        .en(en),
        .load(Sreg),
        .d(imm_ext),
        .q(prog_count)
     );
    
    // ALU
    
    //logic [DATA_WIDTH-1:0] A, B, Out;
    logic Cout;
    logic [DATA_WIDTH-1:0] alu_out;
    
    adder_subtractor_nbit #(.WIDTH(DATA_WIDTH)) alu (
        .A(A),
        .B(B),
        .M(S),
        .Cout(Cout),
        .S(alu_out)
    );
    
    // MULTIPLEXER
    
    localparam IMM_WIDTH = 3;
    
    logic [((IMM_WIDTH > DATA_WIDTH) ? IMM_WIDTH : DATA_WIDTH)-1:0] mux_out;
     
    mux2_1 #(.WIDTH1(IMM_WIDTH), .WIDTH2(DATA_WIDTH)) mux (
        .A(imm),
        .B(alu_out), 
        .S(Sreg),
        .Y(mux_out)
    );
    
    // REGISTER DE-MULTIPLEXING
    
    logic en_A, en_B, en_Out;
    assign en_A = ~D1 & ~D0 & en;
    assign en_B = ~D1 & D0 & en;
    assign en_Out = D1 & ~D0 & en;
    
    // REGISTERS
    
    register_nbit #(.n(DATA_WIDTH)) reg_A(
        .clk(clk),
        .areset(reset_n),
        .en(en_A), 
        .d(mux_out),
        .q(A) 
    );
    
    register_nbit #(.n(DATA_WIDTH)) reg_B(
        .clk(clk),
        .areset(reset_n),
        .en(en_B), 
        .d(mux_out),
        .q(B) 
    );
    
    register_nbit #(.n(DATA_WIDTH)) reg_Out(
        .clk(clk),
        .areset(reset_n),
        .en(en_Out), 
        .d(A),
        .q(Out) 
    );

    
endmodule
