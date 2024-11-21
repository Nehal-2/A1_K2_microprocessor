`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 12:00:28 PM
// Design Name: 
// Module Name: tb_mux2_1
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


module tb_mux2_1;
    localparam WIDTH1 = 4;
    localparam WIDTH2 = 1;
    
    logic [WIDTH1-1:0] A;
    logic [WIDTH2-1:0] B;
    logic S;
    logic [((WIDTH1 > WIDTH2) ? WIDTH1 : WIDTH2)-1:0] Y;
    
    mux2_1 #(.WIDTH1(WIDTH1), .WIDTH2(WIDTH2)) dut (
        .A(A),
        .B(B),
        .S(S),
        .Y(Y)
    );
    
    initial begin
    
    A = 4'b0101; B = 0;
    S = 0; #10
    S = 1; #10
    
    A = 4'b1001; B = 1;
    S = 0; #10
    S = 1; #10
    
    $finish;
    end
        
endmodule
