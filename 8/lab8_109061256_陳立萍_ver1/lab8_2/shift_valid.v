`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 21:54:59
// Design Name: 
// Module Name: shift_valid
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


module shift_valid(
    input clk,
    input rst_n,
    input [9:0]keys,
    output reg shift_valid
    );
    reg [9:0]key_down_temp;

always @(posedge clk or negedge rst_n)
    if (~rst_n)  key_down_temp <= 0;
    else key_down_temp <= keys;
always @*
    if (key_down_temp < keys)  shift_valid  = 1'd1;
    else  shift_valid  <= 1'd0;


endmodule
