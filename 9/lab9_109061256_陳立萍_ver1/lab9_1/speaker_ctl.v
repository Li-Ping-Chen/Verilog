`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 13:40:24
// Design Name: 
// Module Name: speaker_ctl
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


module speaker_ctl(
    input [15:0]audio_left,
    input [15:0]audio_right,
    input clk,
    input rst_n,
    output audio_mclk,  //master clock
    output audio_lrck,  // left-right clock
    output audio_sck,   // serial clock
    output reg audio_sdin    // 1bit output
    );
    wire clk_25div4MHz;
    reg [4:0]audio_cnt;   // 5-bits counter
    reg [4:0]audio_cnt_next;
    reg audio_sdin_next;
    
    assign audio_sck = clk_25div4MHz;
    
    clock_divider U0 (.clk(clk),.rst_n(rst_n)
                       ,.clk_25div4MHz(clk_25div4MHz),.clk_25MHz(audio_mclk),.clk_25div128MHz(audio_lrck));
    
    always @(negedge clk_25div4MHz or negedge rst_n)
        if (~rst_n) audio_cnt <= 5'd0;
        else audio_cnt <= audio_cnt_next;
    
    always @*
        if (audio_cnt >= 5'd31) audio_cnt_next = 5'd0;
        else audio_cnt_next = audio_cnt + 5'd1;
    
    always @*
        case (audio_cnt)
            5'd0: audio_sdin_next = audio_left[15];
            5'd1: audio_sdin_next = audio_left[14];
            5'd2: audio_sdin_next = audio_left[13];
            5'd3: audio_sdin_next = audio_left[12];
            5'd4: audio_sdin_next = audio_left[11];
            5'd5: audio_sdin_next = audio_left[10];
            5'd6: audio_sdin_next = audio_left[9];
            5'd7: audio_sdin_next = audio_left[8];
            5'd8: audio_sdin_next = audio_left[7];
            5'd9: audio_sdin_next = audio_left[6];
            5'd10: audio_sdin_next = audio_left[5];
            5'd11: audio_sdin_next = audio_left[4];
            5'd12: audio_sdin_next = audio_left[3];
            5'd13: audio_sdin_next = audio_left[2];
            5'd14: audio_sdin_next = audio_left[1];
            5'd15: audio_sdin_next = audio_left[0];
            5'd16: audio_sdin_next = audio_right[15];
            5'd17: audio_sdin_next = audio_right[14];
            5'd18: audio_sdin_next = audio_right[13];
            5'd19: audio_sdin_next = audio_right[12];
            5'd20: audio_sdin_next = audio_right[11];
            5'd21: audio_sdin_next = audio_right[10];
            5'd22: audio_sdin_next = audio_right[9];
            5'd23: audio_sdin_next = audio_right[8];
            5'd24: audio_sdin_next = audio_right[7];
            5'd25: audio_sdin_next = audio_right[6];
            5'd26: audio_sdin_next = audio_right[5];
            5'd27: audio_sdin_next = audio_right[4];
            5'd28: audio_sdin_next = audio_right[3];
            5'd29: audio_sdin_next = audio_right[2];
            5'd30: audio_sdin_next = audio_right[1];
            5'd31: audio_sdin_next = audio_right[0];
            default: audio_sdin_next = 1'd0;
        endcase
    
    always @*
        if (~rst_n) audio_sdin = 1'd0;
        else audio_sdin = audio_sdin_next;

endmodule
