`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 19:23:51
// Design Name: 
// Module Name: scan_ctl
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


`define FREQ_DIV_SEG_BIT  14

module scan_ctl(
    input [3:0]digit3,
    input [3:0]digit2,
    input [3:0]digit1,
    input [3:0]digit0,
    input clk,
    input rst_n,
    output reg [3:0]dis,
    output [7:0]segs
    );
    
reg [3:0]bin_next;
reg [`FREQ_DIV_SEG_BIT - 3:0] clk_rec;
reg [`FREQ_DIV_SEG_BIT - 1:0] cnt_tmp;
reg [1:0]clk_out;
reg [3:0]bin_out;
    
    display D_0 (.bin(bin_out),.segs(segs));
    
    always @*
        cnt_tmp = {clk_out,clk_rec} + 1'b1;

    always @(posedge clk or negedge rst_n)
        if (~rst_n) {clk_out,clk_rec} <= `FREQ_DIV_SEG_BIT'd0;
        else {clk_out,clk_rec} <= cnt_tmp;
    
    always @*
        case (clk_out)
            2'b00:  begin
                dis <= 4'b0111;
                bin_next <= digit3;
                end
            2'b01:  begin
                dis <= 4'b1011;
                bin_next <= digit2;
                end
            2'b10:  begin
                dis <= 4'b1101;
                bin_next <= digit1;
                end
            2'b11:  begin
                dis <= 4'b1110;
                bin_next <= digit0;
                end
            default:  begin
                dis <= 4'b0000;
                bin_next <= 4'b0000;
                end
        endcase
    always @*
        bin_out <= bin_next;
        
endmodule
