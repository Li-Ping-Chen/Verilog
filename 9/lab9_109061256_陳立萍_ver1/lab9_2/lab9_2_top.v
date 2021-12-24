`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 16:00:48
// Design Name: 
// Module Name: lab9_2_top
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
    inout PS2_DATA,
    inout PS2_CLK,
    input clk,
    input rst_n,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output [3:0]dis,
    output [7:0]segs
    );
    wire [511:0]key_down;
    wire [8:0]last_change;
    wire key_valid;
    wire rst_p;
    wire [3:0]key_in;
    wire caps_pulse;
    wire mode;
    wire [3:0]letter;
    wire [21:0]note_div;  // freq divisor
    wire [15:0]audio_left;
    wire [15:0]audio_right;
    wire [3:0]digit[1:0];

    assign rst_p = ~rst_n;
    
    KeyboardDecoder U0 (.PS2_DATA(PS2_DATA),.PS2_CLK(PS2_CLK),.rst(rst_p),.clk(clk)
                        ,.key_down(key_down),.last_change(last_change),.key_valid(key_valid));  
    one_pulse U1 (.clk(clk),.rst_n(rst_n),.keys(key_down[88]),.pulse(caps_pulse));
    pb_decoder U2 (.keys({key_down[28],key_down[50],key_down[33],key_down[35], 
                         key_down[36],key_down[43],key_down[52]}),.key_in(key_in));
    FSM_mode U3 (.clk(clk),.rst_n(rst_n),.pulse(caps_pulse),.mode(mode));
    freq_ctl U4 (.shift_down(key_down[18]),.mode(mode),.key_in(key_in),.note_div(note_div),.letter(letter));
    buzzer_ctl U5 (.clk(clk),.rst_n(rst_n),.note_div(note_div),.key_in(key_in)
                    ,.audio_left(audio_left),.audio_right(audio_right));
    speaker_ctl U6 (.clk(clk),.rst_n(rst_n),.audio_left(audio_left),.audio_right(audio_right)
                    ,.audio_mclk(audio_mclk),.audio_lrck(audio_lrck),.audio_sck(audio_sck),.audio_sdin(audio_sdin));
    bin_to_dec U7 (.bin(letter),.digit1(digit[1]),.digit0(digit[0]));
    scan_ctl U8 (.clk(clk),.rst_n(rst_n),.digit3(4'd0),.digit2(4'd0),
                .digit1(digit[1]),.digit0(digit[0]),.segs(segs),.dis(dis));
                
endmodule
