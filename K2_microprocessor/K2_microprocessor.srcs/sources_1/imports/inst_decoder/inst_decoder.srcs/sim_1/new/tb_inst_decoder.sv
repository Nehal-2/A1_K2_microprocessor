`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 03:27:33 PM
// Design Name: 
// Module Name: tb_inst_decoder
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


module tb_inst_decoder;
    localparam n = 8;
    logic [n-1:0] inst;
    logic J, C, D1, D0, Sreg, S;
    logic [2:0] imm;
    
    inst_decoder#(.n(n)) dut(
        .inst(inst),
        .J(J),
        .C(C),
        .D1(D1),
        .D0(D0),
        .Sreg(Sreg),
        .S(S),
        .imm(imm)
    );
    
    initial begin
    
        inst = 8'b00001000; #10
        inst = 8'b00011001; #10
        inst = 8'b00100000; #10
        inst = 8'b00010000; #10
        inst = 8'b01110000; #10
    
        $finish;
    end
    


endmodule
