`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 02:06:04 PM
// Design Name: 
// Module Name: mux3_1
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


module mux3_1#(
        parameter WIDTH_IN = 1
)(
        input logic [WIDTH_IN-1:0] A,
        input logic [WIDTH_IN-1:0] B,
        input logic [WIDTH_IN-1:0] C,
        input logic [1:0] S,
        output logic [WIDTH_IN-1:0] Y
  );
  
  always_comb begin
    case (S)
        2'b01: Y = A;
        2'b10: Y = B;
        2'b11: Y = C;
        default: Y = {WIDTH_IN{1'b0}};
    endcase
  end
   
endmodule
