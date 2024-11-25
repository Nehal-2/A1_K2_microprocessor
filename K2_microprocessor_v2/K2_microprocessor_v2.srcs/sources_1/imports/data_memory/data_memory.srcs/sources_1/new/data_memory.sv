`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2024 08:04:09 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory#(
        parameter WIDTH = 8,
        parameter DEPTH = 8
)(
input logic clk,
input logic reset_n,
input logic [$clog2(DEPTH)-1:0] address,   // Address 8bit
input logic [WIDTH-1:0] data_in,          // Data input 8bit
input logic Wen,                          // One Signal Controlling Write [1] Read [0]
output logic [WIDTH-1:0] data_out       // Data output
    );
    
    logic[WIDTH-1:0] memory [0:DEPTH-1];    // Location memory each location 8bit
     
   always @(negedge clk, negedge reset_n) begin
    if (!reset_n) begin   
        integer i;
        for (i = 0; i < DEPTH; i = i + 1) begin
            memory[i] <= {WIDTH{1'b0}};  //Each location in memory is  filled 0
        end
    end 
        if (Wen) begin
            memory[address] <= data_in; // Write
        end else begin
            data_out <= memory[address]; // Read
        end
    end

endmodule
