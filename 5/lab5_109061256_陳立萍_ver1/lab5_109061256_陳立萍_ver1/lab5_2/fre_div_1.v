`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 00:03:02
// Design Name: 
// Module Name: fre_div_1
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


`define FREQ_DIV_BIT 26
`define FREQ_DIV_1_NUM 50000000  //  create 1hz

module fre_div_1(
output reg clk_out, // 1hz
input clk, // clock input
input rst_p // reset
);
reg [`FREQ_DIV_BIT-1:0] clk_rec; // count
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; // temporary

always @*    cnt_tmp <= clk_rec + 1'b1;

always @(posedge clk or posedge rst_p)
    if (rst_p) begin
        clk_rec <= `FREQ_DIV_BIT'd0;
        clk_out <= 1'd0;
    end
    else if (clk_rec >= `FREQ_DIV_1_NUM)  begin
        clk_rec <= `FREQ_DIV_BIT'd0;
        clk_out <= (~clk_out);
    end
    else clk_rec <= cnt_tmp;

endmodule