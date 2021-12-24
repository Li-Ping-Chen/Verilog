`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 15:34:56
// Design Name: 
// Module Name: fre_div
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

`define FREQ_DIV_BIT 27
`define FREQ_DIV_NUM  50000000
`define FREQ_DIV_CTL_BIT 15

module freq_div(
output reg clk_out, 
output reg clk_ctl, 
input clk, 
input rst
);
reg [`FREQ_DIV_CTL_BIT - 3:0] cnt_l; 
reg [(`FREQ_DIV_BIT - `FREQ_DIV_CTL_BIT) :0] cnt_h; 
reg [`FREQ_DIV_BIT - 1:0] cnt_tmp;

always @*
    cnt_tmp = {cnt_h,clk_ctl,cnt_l} + 1'b1;

always @(posedge clk or negedge rst)
if (rst) 
begin
    {cnt_h, clk_ctl, cnt_l} <= `FREQ_DIV_BIT'd0;
    clk_out <= 1;
end
else if ( {cnt_h, clk_ctl, cnt_l} >= `FREQ_DIV_NUM ) 
begin
    {cnt_h, clk_ctl, cnt_l} <= `FREQ_DIV_BIT'd0;
    clk_out <= ~clk_out;
    end
else 
    {cnt_h, clk_ctl, cnt_l} <= cnt_tmp;
endmodule