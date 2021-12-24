`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 18:29:49
// Design Name: 
// Module Name: fre_div_100
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
`define FREQ_DIV_100_NUM 500000

module fre_div_100(
output reg clk_out, //100hz
input clk,          // global clock input
input rst_n         // reset
);
reg [`FREQ_DIV_BIT-1:0] clk_rec; // current_state
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; // next_state (into FFs)

always @*    
    cnt_tmp <= clk_rec + 1'b1;

always @(posedge clk or negedge rst_n)
    if (~rst_n) begin
        clk_rec <= `FREQ_DIV_BIT'd0;
        clk_out <= 1'd0;
    end
    else if (clk_rec >= `FREQ_DIV_100_NUM)  begin
        clk_rec <= `FREQ_DIV_BIT'd0;
        clk_out <= (~clk_out);
    end
    else clk_rec <= cnt_tmp;

endmodule