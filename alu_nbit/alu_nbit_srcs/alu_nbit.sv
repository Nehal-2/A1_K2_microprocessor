`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 09:49:47 AM
// Design Name: 
// Module Name: alu_nbit
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


module alu_nbit#(
        parameter WIDTH = 4
)(
        input logic [1:0] alu_op,
        input logic [WIDTH-1:0] A,
        input logic [WIDTH-1:0] B,
        output logic [WIDTH-1:0] alu_out,
        output logic Cout
    );
    logic [WIDTH-1:0] add_sub_out, shift_out, and_out;
    
    adder_subtractor_nbit #(WIDTH) u1(
    .A(A),
    .B(B),
    .M(alu_op[0]), 
    .S(add_sub_out), 
    .Cout(Cout)
    );
    
    assign shift_out = A << B;
    assign and_out = A & B;
    
    assign alu_out = (alu_op[1]) ? ((alu_op[0]) ? and_out : shift_out) : add_sub_out;
    
endmodule
