`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 02:37:49 PM
// Design Name: 
// Module Name: inst_decoder
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


module inst_decoder#(
    parameter n = 8
)(
    //input logic reset_n,
    input logic [n-1:0] inst,
    output logic J, C, D1, D0, Sreg, S,
    output logic [2:0] imm
    
);

    always_comb begin
        J = inst[7];
        C = inst[6];
        D1 = inst[5];
        D0 = inst[4];
        Sreg = inst[3];
        S = inst[2];
        imm = inst[2:0];
        
    end


endmodule

//module inst_decoder#(
//    parameter n = 8
//)(
//    input logic [n-1:0]inst,
//    output logic [(1 << n) - 1: 0]out
//);

//    assign out = 1 << inst;

//endmodule
