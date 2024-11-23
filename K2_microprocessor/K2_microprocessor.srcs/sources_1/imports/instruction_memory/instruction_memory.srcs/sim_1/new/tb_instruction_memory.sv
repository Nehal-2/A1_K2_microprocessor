`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 07:57:55 PM
// Design Name: 
// Module Name: tb_instruction_memory
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


module tb_instruction_memory;
    logic [3:0] address;      
    logic [7:0] instruction;    
     
    instruction_memory dut (
        .address(address),
        .instruction(instruction)
    );
    initial begin
        $display("-----------------------------");
        $display("| Address    | Data Out     |");
        $display("-----------------------------");

        address = 4'b0000; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b0001; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b0010; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b0011; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b0100; #10;
        $display("| %b        | %b          |", address, instruction);
 
        address = 4'b0101; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b0110; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b0111; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b1000; #10;
        $display("| %b        | %b          |", address, instruction);

        address = 4'b1111; #10; // Case Not Define
        $display("| %b        | %b          |", address, instruction);

        $display("-----------------------------");

        $finish; 
    end

endmodule
