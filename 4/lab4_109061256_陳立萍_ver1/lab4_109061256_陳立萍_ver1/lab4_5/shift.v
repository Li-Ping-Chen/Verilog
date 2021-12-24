`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:23:54
// Design Name: 
// Module Name: shift
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


`define D_n 8'b1101_0101
`define D_t 8'b1110_0001
`define D_H 8'b1001_0001
`define D_U 8'b1000_0011
`define D_E 8'b0110_0001
`define D_C 8'b0110_0011
`define D_S 8'b0100_1001


module shifter(rst,clk,q_0,q_1,q_2,q_3,q_4,q_5,q_6,q_7);
    input clk,rst;
    output [7:0]q_7;
    output [7:0]q_6;
    output [7:0]q_5;
    output [7:0]q_4;
    output [7:0]q_3;
    output [7:0]q_2;
    output [7:0]q_1;
    output [7:0]q_0;

    reg [7:0]q_0;
    reg [7:0]q_1;
    reg [7:0]q_2;
    reg [7:0]q_3;
    reg [7:0]q_4;
    reg [7:0]q_5;
    reg [7:0]q_6;
    reg [7:0]q_7;


always@(posedge clk or posedge rst)
    if(rst)
        begin
            q_7 <= `D_n;
            q_6 <= `D_t;
            q_5 <= `D_H;
            q_4 <= `D_U;
            q_3 <= `D_E;
            q_2 <= `D_E;
            q_1 <= `D_C;
            q_0 <= `D_S;
        end
    else
        begin
            q_7 <= q_6;
            q_6 <= q_5;
            q_5 <= q_4;
            q_4 <= q_3;
            q_3 <= q_2;
            q_2 <= q_1;
            q_1 <= q_0;
            q_0 <= q_7;
        end
endmodule
