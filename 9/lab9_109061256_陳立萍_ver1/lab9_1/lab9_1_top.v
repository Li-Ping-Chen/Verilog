`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 13:43:00
// Design Name: 
// Module Name: lab9_1_top
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


module top(
    input clk,
    input rst_n,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin
    );
    wire clk_1hz;     // 1hz
    wire [21:0]note_div;  //  frequency divisor
    wire [15:0]audio_left;
    wire [15:0]audio_right;
    
    fre_div_1 U0 (.clk(clk),.rst_n(rst_n),.clk_out(clk_1hz));
    freq_ctl U1 (.clk(clk_1hz),.rst_n(rst_n),.note_div(note_div));
    buzzer_ctl U2 (.clk(clk),.rst_n(rst_n),.note_div(note_div)
                    ,.audio_left(audio_left),.audio_right(audio_right));
    speaker_ctl U3 (.clk(clk),.rst_n(rst_n),.audio_left(audio_left),.audio_right(audio_right)
                    ,.audio_mclk(audio_mclk),.audio_lrck(audio_lrck),.audio_sck(audio_sck),.audio_sdin(audio_sdin));

endmodule