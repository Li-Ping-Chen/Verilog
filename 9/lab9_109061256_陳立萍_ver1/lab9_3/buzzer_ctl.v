`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 20:12:36
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
    input [21:0]note_div_right,
    input [21:0]note_div_left,
    input [3:0]key_in,
    output reg [15:0]audio_left,
    output reg [15:0]audio_right
    );
    reg [21:0]cnt_right;
    reg [21:0]cnt_left;
    reg [21:0]cnt_right_next;
    reg [21:0]cnt_left_next;
    reg ampli_right;
    reg ampli_right_next;
    reg ampli_left;
    reg ampli_left_next;
    
// right ear    
    always @*
        if (cnt_right >= note_div_right) begin
            cnt_right_next = 22'd0;
            ampli_right_next = ~ampli_right;
        end
        else begin
            cnt_right_next = cnt_right + 22'd1;
            ampli_right_next = ampli_right;
        end
    always @(posedge clk or negedge rst_n)
        if (~rst_n) cnt_right = 22'd0;
        else cnt_right <= cnt_right_next;        
    always @(posedge clk or negedge rst_n)
        if (~rst_n) ampli_right <= 1'd0;
        else ampli_right <= ampli_right_next;
          
// letf ear        
    always @*
        if (cnt_left >= note_div_left) begin
            cnt_left_next = 22'd0;
            ampli_left_next = ~ampli_left;
        end
        else begin
            cnt_left_next = cnt_left + 22'd1;
            ampli_left_next = ampli_left;
        end
    always @(posedge clk or negedge rst_n)
        if (~rst_n) cnt_left = 22'd0;
        else cnt_left <= cnt_left_next;      
    always @(posedge clk or negedge rst_n)
        if (~rst_n) ampli_left <= 1'd0;
        else ampli_left <= ampli_left_next;
   
// amplitude
    always @*
        if (key_in) begin
            if (ampli_right) audio_right = 16'h1FFF;
            else audio_right = 16'hE000;
        end
        else audio_right = 16'h0;
    
    always @*
        if (key_in) begin
            if (ampli_left) audio_left = 16'h1FFF;
            else audio_left = 16'hE000;
        end
        else audio_left = 16'h0;

endmodule
