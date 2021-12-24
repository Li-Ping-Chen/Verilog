`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 00:21:56
// Design Name: 
// Module Name: fre_vol_ctl
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


module fre_vol_ctl(
    input clk_100hz,
    input rst_n,
    input do_debounced,
    input re_debounced,
    input mi_debounced,
    input vol_up_pulse,
    input vol_down_pulse,
    output reg [21:0]note_freq,  // divisor
    output reg [15:0]vol_pos,    // max
    output reg [15:0]vol_neg,    // min
    output reg [3:0]val_volume   // volumn
    );   
    reg [1:0]freq_sel;   // select divisor 
    reg [1:0]freq_sel_next;
    reg [3:0]vol_in_next;
    reg [3:0]vol_in;
    
// frequency control
    always @*
        if (do_debounced) freq_sel_next = 2'd1;
        else if (re_debounced) freq_sel_next = 2'd2;
        else if (mi_debounced) freq_sel_next = 2'd3;
        else freq_sel_next = 2'd0;
    
    always @(posedge clk_100hz or negedge rst_n)
        if (~rst_n) freq_sel <= 2'd0;
        else freq_sel <= freq_sel_next;
    
    always @*
        case (freq_sel)
            2'd1: note_freq = 22'd191571; // Do divisor
            2'd2: note_freq = 22'd170648; // Re divisor
            2'd3: note_freq = 22'd151515; // Mi divisor
            default: note_freq = 22'd0;
        endcase
    
// volumn control
    always @* begin
        if  (vol_up_pulse) vol_in = val_volume + 4'd1;       // volumn + 1
        else if (vol_down_pulse) vol_in = val_volume - 4'd1; // volumn - 1
        else vol_in = val_volume;  // remain the same volumn
    end
    
    always @(posedge clk_100hz or negedge rst_n)
        if (~rst_n) val_volume <= 4'd0;
        else val_volume <= vol_in;
 
    always @* begin
        vol_pos = val_volume * 16'd1000;
        vol_neg = ~vol_pos + 16'd1;       //  2's complement of vol_pos
    end
     
endmodule

