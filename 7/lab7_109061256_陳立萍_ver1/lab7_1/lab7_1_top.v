`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/20 21:30:58
// Design Name: 
// Module Name: lab7_1_top
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
    input rst,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output [15:0]audio_left,
    output [15:0]audio_right
    );
    wire [15:0]vol_pos;
    wire [15:0]vol_neg;
    wire [21:0]note_freq;
    
    assign note_freq = 22'd151515;  // Mi
    assign vol_pos = 16'h7FFF;    //max
    assign vol_neg = 16'h8000;    // min
    
    buzzer_ctl U0 (.clk(clk),.rst(rst),.note_div(note_freq)
                    ,.vol_pos(vol_pos),.vol_neg(vol_neg),.audio_left(audio_left),.audio_right(audio_right));
    speaker_ctl U1 (.clk(clk),.rst(rst),.audio_left(audio_left),.audio_right(audio_right)
                     ,.audio_mclk(audio_mclk),.audio_lrck(audio_lrck),.audio_sck(audio_sck),.audio_sdin(audio_sdin));

endmodule

