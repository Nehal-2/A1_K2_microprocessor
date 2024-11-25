`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 07:29:07 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory#(
        parameter WIDTH = 8,
        parameter DEPTH = 16
)(
    input logic [3:0] address,
    output logic [WIDTH-1:0] instruction // Data output
);

    logic [WIDTH-1:0] memory [0:DEPTH-1]; 
    
    // Instruction
    always @(*) begin 
    case (address)
             // Original Fibonacci instructions:
//            4'b0000: instruction = 8'b00001000; // RA = 0
//            4'b0001: instruction = 8'b00011001; // RB = 1
//            4'b0010: instruction = 8'b00100000; // RO = RA
//            4'b0011: instruction = 8'b00010000; // RB = RA + RB
//            4'b0100: instruction = 8'b01110000; // JC = 0
//            4'b0101: instruction = 8'b00000000; // RA = RA + RB
//            4'b0110: instruction = 8'b00010100; // RB = RA − RB
//            4'b0111: instruction = 8'b00000100; // RA = RA − RB
//            4'b1000: instruction = 8'b10110010; // J = 2
            
            // Updated Fibonacci instructions:
            4'b0000: instruction = 8'b10001000; // RA = [0]            
            4'b0001: instruction = 8'b01111010; // [2] = RA
            4'b0010: instruction = 8'b00100000; // RO = RA
            4'b0011: instruction = 8'b10001001; // RA = [1]            
            4'b0100: instruction = 8'b10011010; // RB = [2]
            4'b0101: instruction = 8'b00100000; // RO = RA
            4'b0110: instruction = 8'b01111010; // [2] = RA
            4'b0111: instruction = 8'b00000000; // RA = RA + RB
            4'b1000: instruction = 8'b01110000; // JC = 0
            4'b1001: instruction = 8'b10110100; // J = 4
            default: instruction = 8'bZZZZZZZZ; // Case Defult
            
            // Testing JZ instruction:
//            4'b0000: instruction = 8'b10001000; // RA = [0]            
//            4'b0001: instruction = 8'b00011001; // RB = 1
//            4'b0010: instruction = 8'b00100000; // RO = RA
//            4'b0011: instruction = 8'b00000000; // RA = RA + RB
//            4'b0100: instruction = 8'b11110000; // JZ = 0
//            4'b0101: instruction = 8'b10110010; // J = 2
//            default: instruction = 8'bZZZZZZZZ; // Case Defult
        endcase
    end

endmodule
