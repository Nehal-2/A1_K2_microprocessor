`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 11:33:01 AM
// Design Name: 
// Module Name: tb_alu_4bit
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


module tb_alu_4bit;
    logic [3:0] a;
    logic [3:0] b;
    logic [1:0] alu_op;
    logic c_out;
    logic [3:0] alu_result;
    
    alu_nbit dut (
        .A(a),
        .B(b),
        .alu_op(alu_op),
        .Cout(c_out),
        .alu_out(alu_result)
    );
    initial begin
    // Display header for results with fixed spacing
    $display("Time   |   OP  | Input A | Input B | Output");
    $display("--------------------------------------------------------------");

    // Test case 1: Add 4'b0010 + 4'b0010
    a = 4'b0010; b = 4'b0010;
    alu_op = 2'b00; #10;
    $display("%0t   |  %b   |  %b  |  %b   |  %b ", 
             $time, alu_op, a, b, alu_result);

    // Test case 2: Subtract 4'b1111 - 4'b1111 
    a = 4'b1111; b = 4'b1111;
    alu_op = 2'b01; #10;
    $display("%0t   |  %b   |  %b  |  %b   |  %b ", 
             $time, alu_op, a, b, alu_result);

    // Test case 3: Shift 4'0100 by 4'b0001
    a = 4'b0100; b = 4'b0001;
    alu_op = 2'b10; #10;
    $display("%0t   |  %b   |  %b  |  %b   |  %b ", 
             $time, alu_op, a, b, alu_result);

    // Test case 4: AND 4'b1001 & 4'b1101
    a = 4'b1001; b = 4'b1101;
    alu_op = 2'b11; #10;
    $display("%0t   |  %b   |  %b  |  %b   |  %b ", 
             $time, alu_op, a, b, alu_result);

    // End simulation
            $finish;
    end
endmodule
