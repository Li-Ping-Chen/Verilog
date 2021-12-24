`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/07 21:16:58
// Design Name: 
// Module Name: lab1_3
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


module adder_subtractor(
    input [2:0] a,
    input [2:0] b,
    input m,
    output [2:0] s,
    output v,
    output [2:0] c
    );
    
    assign s[0] = a[0] ^ (b[0] ^ m) ^ m;
    assign c[0] = a[0] & (b[0] ^ m) | m & a[0] | m & (b[0] ^ m);
    assign s[1] = (a[1] ^ (b[1] ^ m)) ^ c[0];
    assign c[1] = a[1] & (b[1] ^ m) | c[0] & a[1] | c[0] & (b[1] ^ m);
    assign s[2] = (a[2] ^ (b[2] ^ m)) ^ c[1];
    assign c[2] = a[2] & (b[2] ^ m) | c[1] & a[2] | c[1] & (b[2] ^ m);
    assign v = c[2] ^ c[1];

endmodule
