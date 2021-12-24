`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 00:19:16
// Design Name: 
// Module Name: buzzer_ctl
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


module buzzer_ctl(
    input clk,
    input rst_n,
    input [21:0]note_div,  // divisor
    input [15:0]vol_pos,   // volumn max
    input [15:0]vol_neg,   // volumn min
    output reg [15:0]audio_left,
    output reg [15:0]audio_right
    );    
    reg [21:0]clk_cnt;
    reg [21:0]cnt_next;
    reg ampli_next;
    reg ampli;      // amplitude
    
    always @*      // divide divisor
        if (clk_cnt >= note_div) begin
            cnt_next = 22'd0;
            ampli_next = ~ampli;
        end
        else begin
            cnt_next = clk_cnt + 22'd1;
            ampli_next = ampli;
        end
    
    always @(posedge clk or negedge rst_n)
        if (~rst_n) clk_cnt = 22'd0;
        else clk_cnt <= cnt_next;
        
    
    always @(posedge clk or negedge rst_n)
        if (~rst_n) ampli <= 1'd0;
        else ampli <= ampli_next;
    
    always @*
        if (ampli) begin  // max
            audio_right = vol_pos;
            audio_left = vol_pos;
        end
        else begin    //min
            audio_right = vol_neg;
            audio_left = vol_neg;
        end

endmodule


