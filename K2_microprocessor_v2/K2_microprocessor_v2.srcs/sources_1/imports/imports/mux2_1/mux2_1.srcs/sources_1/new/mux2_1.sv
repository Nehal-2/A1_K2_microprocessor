`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 11:59:26 AM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1#(
        parameter WIDTH1 = 4,
        parameter WIDTH2 = 4
)(
        input logic [WIDTH1-1:0] A,
        input logic [WIDTH2-1:0] B,
        input logic S,
        output logic [((WIDTH1 > WIDTH2) ? WIDTH1 : WIDTH2)-1:0] Y
  );
  
  localparam MAX_WIDTH = (WIDTH1 > WIDTH2) ? WIDTH1 : WIDTH2;
  logic [MAX_WIDTH-1:0] A_ext, B_ext; // Extended versions of A and B (zero-padded if smaller in size)
  
  assign A_ext = {{(MAX_WIDTH - WIDTH1){1'b0}}, A};
  assign B_ext = {{(MAX_WIDTH - WIDTH2){1'b0}}, B};
  
  always_comb begin
    if (S)
        Y = A_ext;
    else
        Y = B_ext;
  end
   
endmodule
