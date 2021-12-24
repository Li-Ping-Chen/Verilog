`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:26:19
// Design Name: 
// Module Name: 1hz
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


module divide(clk,rst,clk_out,clk_ctl);
input clk,rst;
output clk_out;
output [1:0]clk_ctl;

reg clk_out;
reg [1:0]clk_ctl;
reg [15:0]a;
reg [7:0]b;
reg [26:0]tmp;

always@*
    tmp = {clk_out,b,clk_ctl,a} + 1'b1;
    
always@(posedge clk or posedge rst)
   if (rst)
      {clk_out,b,clk_ctl,a} <= 27'b0;
   else
      {clk_out,b,clk_ctl,a} <= tmp;

endmodule