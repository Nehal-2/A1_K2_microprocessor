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


module microprocessor_top(
        input logic clk,
        input logic reset_n,
        input logic en,
        output logic RA, RB, RO

    );
    
    localparam INST_WIDTH = 8;
    localparam INST_DEPTH = 16;
    localparam DATA_WIDTH = 8;
    
    // INSTRUCTION MEMORY
    
    logic [INST_WIDTH-1:0] inst;
    logic J, C, D1, D0, Sreg, S;
    logic [2:0] imm;
    
    // INSTRUCTION MEMORY
    
    // PROGRAM COUNTER
    
    logic prog_count;
    
    mod_n_counter#(.N(INST_DEPTH)) PC (
        .clk(clk),
        .areset(reset_n),
        .en(en),
        .load(Sreg),
        .d(imm),
        .q(prog_count)
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
    
    // ALU
    
    logic [DATA_WIDTH-1:0] A, B, Out;
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
    
    localparam WIDTH1 = 3;
    localparam WIDTH2 = 8;
    
    logic [((WIDTH1 > WIDTH2) ? WIDTH1 : WIDTH2)-1:0] mux_out;
     
    mux2_1 #(.WIDTH1(WIDTH1), .WIDTH2(WIDTH2)) mux (
        .A(imm),
        .B(alu_out), 
        .S(Sreg),
        .Y(mux_out)
    );
    
    // REGISTER DE-MULTIPLEXING
    
    logic en_A, en_B, en_Out;
    assign en_A = ~D1 & ~D0;
    assign en_B = ~D1 & D0;
    assign en_Out = D1 & ~D0;
    
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
