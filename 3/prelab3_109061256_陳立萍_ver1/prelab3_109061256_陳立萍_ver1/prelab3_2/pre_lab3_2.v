`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 22:21:46
// Design Name: 
// Module Name: pre_lab3_2
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


module shift_reg(q,clk,rst);
    input clk, rst;
    output [7:0]q;
    reg [7:0]q;

always@(posedge clk or posedge rst)
    if(rst) 
        begin
            q[7]<=1;
            q[6]<=0;
            q[5]<=1;
            q[4]<=0;
            q[3]<=1;
            q[2]<=0;
            q[1]<=1;
            q[0]<=0;
        end
    else
        begin
            q[7]<=q[6];
            q[6]<=q[5];
            q[5]<=q[4];
            q[4]<=q[3];
            q[3]<=q[2];
            q[2]<=q[1];
            q[1]<=q[0];
            q[0]<=q[7];
        end

endmodule
