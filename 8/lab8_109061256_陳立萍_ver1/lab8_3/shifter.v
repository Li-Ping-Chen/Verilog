`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/10 13:29:45
// Design Name: 
// Module Name: shifter
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


module shifter(
	input shift_valid,
    input rst_n,
    input clk,
    input [3:0]key_in,
    output reg [3:0]one_tmp,
    output reg [3:0]ten_tmp
    );
    reg [3:0]one_tmp_next;
    reg [3:0]ten_tmp_next;

    always@(posedge clk or negedge rst_n)
        if (~rst_n) begin
            one_tmp <= 4'd0;
            ten_tmp <= 4'd0;
        end
        else begin
            one_tmp <= one_tmp_next;
            ten_tmp <= ten_tmp_next;
        end

    always @*
        if (shift_valid && ten_tmp == 0) begin
            one_tmp_next <= key_in;
            ten_tmp_next <= one_tmp;
        end
        else begin
            one_tmp_next <= one_tmp;
            ten_tmp_next <= ten_tmp;
        end

endmodule
