`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/20 23:02:03
// Design Name: 
// Module Name: testbench
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


module test_lab7_1;
reg clk; 
reg rst;
wire audio_mclk;
wire audio_lrck;
wire audio_sck;
wire audio_sdin;
wire [15:0]audio_left;
wire [15:0]audio_right;

top U0(.audio_mclk(audio_mclk),.audio_lrck(audio_lrck),.audio_sck(audio_sck),.audio_sdin(audio_sdin),
        .clk(clk),.rst(rst),.audio_left(audio_left),.audio_right(audio_right));

initial
    begin
        clk = 1'b1;
        rst = 1'b1;
        #0.01 rst = 1'b0;
    end
    
always 
    #0.001 clk = ~clk;

endmodule
