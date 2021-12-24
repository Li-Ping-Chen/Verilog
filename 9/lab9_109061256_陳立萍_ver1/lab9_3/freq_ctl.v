`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 19:25:27
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
    input mode,
    input shift_down,
    input double_sound,
    input [3:0]key_in,
    output reg [21:0]note_div_right,
    output reg [21:0]note_div_left,
    output reg [3:0]letter
    );
    reg [4:0]note_right;
    reg [4:0]note_left;
    
// shift/ lower/ upper    
    always @*
        if (key_in != 4'd0 && shift_down && mode) letter = key_in;   // shift + upper
        else if (key_in != 4'd0 && shift_down && ~mode) letter = key_in + 4'd7;  // shift + lower
        else if (key_in != 4'd0 && mode) letter = key_in + 4'd7;   // upper
        else letter = key_in;                    // lower 

// double sound    
    always @*
        if (double_sound) note_right = letter + 5'd2; // add two pitches
        else note_right = letter;
    always @* note_left = letter;

// right ear frequency    
    always @*
        case (note_right)
            5'd1: note_div_right = 22'd191571;
            5'd2: note_div_right = 22'd170648;
            5'd3: note_div_right = 22'd151515;
            5'd4: note_div_right = 22'd143266;
            5'd5: note_div_right = 22'd127551;
            5'd6: note_div_right = 22'd113636;
            5'd7: note_div_right = 22'd101215;
            5'd8: note_div_right = 22'd95420;
            5'd9: note_div_right = 22'd85034;
            5'd10: note_div_right = 22'd75758;
            5'd11: note_div_right = 22'd71633;
            5'd12: note_div_right = 22'd63776;
            5'd13: note_div_right = 22'd56818;
            5'd14: note_div_right = 22'd50607;
            5'd15: note_div_right = 22'd47801;
            5'd16: note_div_right = 22'd42553;
            default: note_div_right = 22'd1;
        endcase
        
// left ear frequency    
    always @*
        case (note_left)
            5'd1: note_div_left = 22'd191571;
            5'd2: note_div_left = 22'd170648;
            5'd3: note_div_left = 22'd151515;
            5'd4: note_div_left = 22'd143266;
            5'd5: note_div_left = 22'd127551;
            5'd6: note_div_left = 22'd113636;
            5'd7: note_div_left = 22'd101215;
       		5'd8: note_div_left = 22'd95420;
            5'd9: note_div_left = 22'd85034;
            5'd10: note_div_left = 22'd75758;
            5'd11: note_div_left = 22'd71633;
            5'd12: note_div_left = 22'd63776;
            5'd13: note_div_left = 22'd56818;
            5'd14: note_div_left = 22'd50607;
            5'd15: note_div_left = 22'd47801;
            5'd16: note_div_left = 22'd42553;
            default: note_div_left = 22'd1;
       endcase

endmodule
