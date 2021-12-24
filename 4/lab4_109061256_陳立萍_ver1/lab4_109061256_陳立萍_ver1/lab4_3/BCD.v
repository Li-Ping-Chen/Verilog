`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 23:48:49
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


module BCD_up(clk,rst,b);
    input clk;
    input rst;
    output [3:0]b;

    reg [3:0]b;
    reg [3:0]b_in;
   
always@*
        b_in = b + 4'b0001;

always@(posedge clk or posedge rst)
    begin
        if(rst)
            b <= 4'b0000;
        else if (b < 4'd9)
            b <= b_in; 
        else
            b <= 4'b0000;
    end
       
endmodule

