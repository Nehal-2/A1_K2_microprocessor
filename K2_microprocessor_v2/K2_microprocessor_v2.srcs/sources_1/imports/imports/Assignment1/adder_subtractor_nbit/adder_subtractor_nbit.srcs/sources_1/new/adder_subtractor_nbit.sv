`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 09:16:36 AM
// Design Name: 
// Module Name: adder_subtractor_nbit
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


module adder_subtractor_nbit#(
        parameter WIDTH = 4
)(
        input logic [WIDTH-1:0] A,
        input logic [WIDTH-1:0] B,
        input logic M,
        output logic [WIDTH-1:0] S,
        output logic Cout

    );
    logic [WIDTH:0] C;
    assign C[0] = M;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i++) begin
            logic X;
            xor (X, M, B[i]);
            fulladder FA(
                .A(A[i]),
                .B(X),
                .Cin(C[i]),
                .Cout(C[i+1]),
                .S(S[i])
            );
        end
    endgenerate
    assign Cout = C[WIDTH];
    
endmodule
