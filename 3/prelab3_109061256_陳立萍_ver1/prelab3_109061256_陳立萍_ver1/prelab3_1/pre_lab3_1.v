`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 22:05:21
// Design Name: 
// Module Name: pre_lab3_1
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


module up_counter(q,clk,rst);
    output [3:0]q;
    input clk, rst;
    reg [3:0]q;
    reg [3:0]q_now;

always@(q)
    q_now = q + 4'd1;
    
always@(posedge clk or posedge rst )
    if(~rst) 
        q<=4'd0;
    else 
        q<=q_now;

endmodule
