`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 16:00:11
// Design Name: 
// Module Name: freq_ctl
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


module freq_ctl(
    input shift_down,
    input mode,
    input [3:0]key_in,
    input clk,
    input rst_n,
    output reg [21:0]note_div,
    output reg [3:0]letter
    );
        
    always @*
        if (key_in != 4'd0 && shift_down && mode) letter = key_in;   // shift + upper
        else if (key_in != 4'd0 && shift_down && ~mode) letter = key_in + 4'd7;  // shift + lower
        else if (key_in != 4'd0 && mode) letter = key_in + 4'd7;   // upper
        else letter = key_in;                    // lower
        
    always @*
        case (letter)
            4'd1: note_div = 22'd191571;
            4'd2: note_div = 22'd170648;
            4'd3: note_div = 22'd151515;
            4'd4: note_div = 22'd143266;
            4'd5: note_div = 22'd127551;
            4'd6: note_div = 22'd113636;
            4'd7: note_div = 22'd101215;
            4'd8: note_div = 22'd95420;
            4'd9: note_div = 22'd85034;
            4'd10: note_div = 22'd75758;
            4'd11: note_div = 22'd71633;
            4'd12: note_div = 22'd63776;
            4'd13: note_div = 22'd56818;
            4'd14: note_div = 22'd50607;
            default: note_div = 22'd500000;
        endcase
      
endmodule
