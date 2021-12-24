`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/09 23:06:10
// Design Name: 
// Module Name: lab1_bonus
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


module comparator(
    input a2,
    input a1,
    input a0,
    input b2,
    input b1,
    input b0,
    output o2,
    output o1,
    output o0,
    output sel
    );
    
    assign sel = (a2 & (~b2)) | ((~(a2 ^ b2)) & a1 & (~b1)) | ((~(a2 ^ b2)) & (~(a1 ^ b1)) & a0 & (~b0));
    assign o2 = (sel) ? b2 : a2;
    assign o1 = (sel) ? b1 : a1;
    assign o0 = (sel) ? b0 : a0;
    
endmodule
