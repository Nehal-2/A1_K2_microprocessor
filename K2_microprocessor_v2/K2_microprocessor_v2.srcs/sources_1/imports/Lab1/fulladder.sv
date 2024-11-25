`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 04:49:53 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
        input logic A,
        input logic B,
        input logic Cin,
        output logic Cout,
        output logic S

    );
    logic c1, s1, c2;
    
    halfadder HD1(.S(s1), .C(c1), .A(A), .B(B));
    halfadder HD2(.S(S), .C(c2), .A(Cin), .B(s1));
    
    or (Cout, c1, c2);
    
endmodule
