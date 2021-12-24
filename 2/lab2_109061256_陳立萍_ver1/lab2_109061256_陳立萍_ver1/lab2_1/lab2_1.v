`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/16 23:26:37
// Design Name: 
// Module Name: lab2_1
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


module lab2_1(
    input a,
    input b,
    input c,
    input d,
    output w,
    output x,
    output y,
    output z
    );
    
    assign z = (~d);
    assign y = c & d | (~c) & (~d);
    assign x = ((~b) & c) | ((~b) & d) | (b & (~c) & (~d));
    assign w = a | (b & c) | (b & d);
    
endmodule
