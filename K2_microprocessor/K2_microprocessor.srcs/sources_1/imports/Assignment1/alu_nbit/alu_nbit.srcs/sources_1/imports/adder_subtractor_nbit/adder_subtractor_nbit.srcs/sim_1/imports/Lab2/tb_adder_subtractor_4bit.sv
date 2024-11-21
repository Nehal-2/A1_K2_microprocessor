`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 04:19:28 PM
// Design Name: 
// Module Name: tb_adder_subtractor_4bit
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


module tb_adder_subtractor_4bit;
    logic [3:0] a;
    logic [3:0]b; 
    logic [3:0]s;
    logic m;
    logic c_out;
    
    adder_subtractor_nbit dut (
        .A(a),
        .B(b),
        .M(m),
        .Cout(c_out),
        .S(s)

    );
    initial begin
    // Display header for results with fixed spacing
    $display("Time   | M | A3 A2 A1 A0 | B3 B2 B1 B0 | S3 S2 S1 S0 | Cout");
    $display("--------------------------------------------------------------");

    // Test case 1: Add 4'b0000 + 4'b0000
    a = 4'b0000;
    b = 4'b0000;
    m = 0; #10;
    $display("%0t   |  %b   |  %b    |  %b    |  %b    |   %b", 
             $time, m, a, b, s, c_out);

    // Test case 2: Subtract 4'b1111 - 4'b1111 
    a = 4'b1111;
    b = 4'b1111;
    m = 1; #10;
    $display("%0t   |  %b   |  %b    |  %b    |  %b    |   %b", 
             $time, m, a, b, s, c_out);

    // Test case 3: Subtract 4'b0010 - 4'b0001
    a = 4'b0010;
    b = 4'b0001;
    m = 1; #10;
    $display("%0t   |  %b   |  %b    |  %b    |  %b    |   %b", 
             $time, m, a, b, s, c_out);

    // Test case 4: Add 4'b1100 + 4'b1100
    a = 4'b1100;
    b = 4'b1100;
    m = 0; #10;
    $display("%0t   |  %b   |  %b    |  %b    |  %b    |   %b", 
             $time, m, a, b, s, c_out);
    // End simulation
            $finish;
    end
endmodule
