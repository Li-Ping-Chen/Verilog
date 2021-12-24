`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:14:46
// Design Name: 
// Module Name: BCD
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


module BCD_down(clk,rst,b);
    input clk; 
    input rst; 
    output [3:0]b;

    reg [3:0]b;
    reg [3:0]b_tmp;

always@*
   b_tmp = b - 4'b0001;
 
always@(posedge clk or posedge rst)
   if(rst)
      b <= 4'b0000;
   else if (b > 4'd0000)
      b <= b_tmp; 
   else
      b = 4'b1001;
      
endmodule
