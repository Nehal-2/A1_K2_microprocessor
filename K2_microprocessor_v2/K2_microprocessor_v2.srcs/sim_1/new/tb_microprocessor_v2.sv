`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 02:42:42 PM
// Design Name: 
// Module Name: tb_microprocessor_v2
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


module tb_microprocessor_v2;
    logic clk;
    logic reset_n;
    logic en;
    logic [3:0] prog_count;
    logic [7:0] RA, RB, RO;
    
    microprocessor_v2 dut (
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .prog_count(prog_count),
        .A(RA),
        .B(RB),
        .Out(RO)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units clock period
    end
    
    // Test sequence
    initial begin
        $display("                Time   | Reset | Enable |     PC     |      RA      |      RB      |        RO");
        $display("             ---------------------------------------------------------------------------------------");
        $monitor("%t   |   %b   |    %b   |    %b   |    %b   |   %b   |      %b", $time, reset_n, en, prog_count, RA, RB, RO);
        
        // Initialize
        reset_n = 0; en = 0; #10
        en = 1; reset_n = 1; #110;
        
        // Reset
        reset_n = 0; #10;
        reset_n = 1; #10;

        // Enable
        en = 1; #30
        
        
        en = 0; #10
        
        en = 1; #220;
        
        // Reset
        reset_n = 0; #10;
        reset_n = 1; #10;
          
        
        $stop;
    end
endmodule