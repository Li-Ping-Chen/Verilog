`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 00:22:28
// Design Name: 
// Module Name: lab7_2_top
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
    input clk_100mhz,
    input rst,  //switch rst
    input pb_do,
    input pb_re,
    input pb_mi,
    input pb_vol_up,
    input pb_vol_down,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output [3:0]dis,
    output [7:0]segs
    );
    
    wire [15:0]audio_left;
    wire [15:0]audio_right;
    wire clk_100hz;
    wire do_debounced;
    wire re_debounced;
    wire mi_debounced;
    wire vol_up_debounced;
    wire vol_down_debounced;
    wire vol_up_pulse;
    wire vol_down_pulse;
    wire [21:0]note_freq;
    wire [15:0]vol_pos;
    wire [15:0]vol_neg;
    wire [3:0]val_volume;
    wire [3:0]val_volume_digit[1:0];
    
    fre_div_100 C0 (.clk(clk_100mhz),.rst_n(rst),.clk_out(clk_100hz));
    debounce A0 (.pb_in(pb_do),.rst_n(rst),.clk(clk_100hz),.pb_debounced(do_debounced));
    debounce A1 (.pb_in(pb_re),.rst_n(rst),.clk(clk_100hz),.pb_debounced(re_debounced));
    debounce A2 (.pb_in(pb_mi),.rst_n(rst),.clk(clk_100hz),.pb_debounced(mi_debounced));
    debounce A3 (.pb_in(pb_vol_up),.rst_n(rst),.clk(clk_100hz),.pb_debounced(vol_up_debounced));
    debounce A4 (.pb_in(pb_vol_down),.rst_n(rst),.clk(clk_100hz),.pb_debounced(vol_down_debounced));
    one_pulse B0 (.in_trig(vol_up_debounced),.clk(clk_100hz),.rst_n(rst),.one_pulse(vol_up_pulse));
    one_pulse B1 (.in_trig(vol_down_debounced),.clk(clk_100hz),.rst_n(rst),.one_pulse(vol_down_pulse));
    fre_vol_ctl U0 (.clk_100hz(clk_100hz),.rst_n(rst),.do_debounced(do_debounced),.re_debounced(re_debounced),
                  .mi_debounced(mi_debounced),.vol_up_pulse(vol_up_pulse),.vol_down_pulse(vol_down_pulse),
                 .note_freq(note_freq),.vol_pos(vol_pos),.vol_neg(vol_neg),.val_volume(val_volume));
    buzzer_ctl U1 (.clk(clk_100mhz),.rst_n(rst),.note_div(note_freq)
                    ,.vol_pos(vol_pos),.vol_neg(vol_neg),.audio_left(audio_left),.audio_right(audio_right));
    speaker_ctl U2 (.clk(clk_100mhz),.rst_n(rst),.audio_left(audio_left),.audio_right(audio_right)
                    ,.audio_mclk(audio_mclk),.audio_lrck(audio_lrck),.audio_sck(audio_sck),.audio_sdin(audio_sdin));
    vol_to_ssd U3 (.bin(val_volume),.digit1(val_volume_digit[1]),.digit0(val_volume_digit[0]));
    scan_ctl D0 (.digit3(4'd0),.digit2(4'd0),.digit1(val_volume_digit[1]),.digit0(val_volume_digit[0])
                         ,.clk(clk_100mhz),.rst_n(rst),.dis(dis),.segs(segs));
                         
endmodule
