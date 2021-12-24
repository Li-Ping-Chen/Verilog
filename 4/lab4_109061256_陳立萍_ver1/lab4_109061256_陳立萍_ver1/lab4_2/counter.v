`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 23:14:37
// Design Name: 
// Module Name: counter
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


module counter(rst, clk,b);
    input  rst, clk;
    output [3:0]b;
    reg [3:0]b;
    reg[3:0]b_tmp;
    
    
always@(posedge clk or posedge rst)
    if(rst) 
      b<=4'd0;
    else 
      b<=b + 4'd1;     
    
endmodule
