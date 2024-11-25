`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 02:09:18 PM
// Design Name: 
// Module Name: tb_mux3_1
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


module tb_mux3_1;
    localparam WIDTH_IN = 1;
    
    logic [WIDTH_IN-1:0] A;
    logic [WIDTH_IN-1:0] B;
    logic [WIDTH_IN-1:0] C;
    logic [1:0] S;
    logic [WIDTH_IN-1:0] Y;
    
    mux3_1 #(.WIDTH_IN(WIDTH_IN)) dut (
        .A(A),
        .B(B),
        .C(C),
        .S(S),
        .Y(Y)
    );
    
    initial begin
    
    A = 1'b1; B = 1'b0; C = 1'b1;
    S = 2'b00; #10
    S = 2'b01; #10
    S = 2'b10; #10
    S = 2'b11; #10
    
    A = 1'b0; B = 1'b1; C = 1'b0;
    S = 2'b00; #10
    S = 2'b01; #10
    S = 2'b10; #10
    S = 2'b11; #10
    
    $finish;
    end
        
endmodule
