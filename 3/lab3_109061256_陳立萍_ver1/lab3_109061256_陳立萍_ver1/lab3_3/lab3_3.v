`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 21:30:26
// Design Name: 
// Module Name: lab3_3
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
    input clk, rst;
    output [3:0]q;
    reg [3:0]q;
    reg [3:0]q_now;

always@(q)
    q_now = q + 4'd1;
    
always@(posedge clk or posedge rst)
    if(rst) 
        q<=4'd0;
    else 
        q<=q_now;

endmodule


