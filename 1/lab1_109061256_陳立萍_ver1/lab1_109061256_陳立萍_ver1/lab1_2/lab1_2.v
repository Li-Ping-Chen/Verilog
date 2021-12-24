`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/07 17:08:45
// Design Name: 
// Module Name: lab1_2
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


module lab1_2(
    input a1,
    input a0,
    input b1,
    input b0,
    output c3,
    output c2,
    output c1,
    output c0,
    output c
    );
    
assign c0 = a0 & b0;
assign c1 = (a0 & b1) ^ (a1 & b0);
assign c = (a0 & b1) & (a1 & b0);
assign c2 = (a1 & b1) ^ c;
assign c3 = (a1 & b1) & c;


endmodule
