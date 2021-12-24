`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 13:44:52
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
    input clk,
    input rst_n,
    output reg [21:0]note_div  // freq divisor
    );
    reg [3:0]counter;    // ounter 0~13(14freq)
    reg [3:0]counter_next;
    
    always @ (negedge clk or negedge rst_n)
        if (~rst_n) counter <= 4'd0;
        else counter <= counter_next;
        
    always @*   // counting...
        if (counter >= 4'd13) counter_next = 4'd0;
        else counter_next = counter + 4'd1;
        
    always @*
        case (counter)  // output divisor 
            4'd0: note_div = 22'd191571;  // Do
            4'd1: note_div = 22'd170648;  // Re
            4'd2: note_div = 22'd151515;  // Mi
            4'd3: note_div = 22'd143266;  // Fa
            4'd4: note_div = 22'd127551;  // So
            4'd5: note_div = 22'd113636;  // La
            4'd6: note_div = 22'd101215;  // Si
            4'd7: note_div = 22'd95420;   // high Do
            4'd8: note_div = 22'd85034;   // high Re
            4'd9: note_div = 22'd75758;   // high Mi
            4'd10: note_div = 22'd71633;  // high Fa
            4'd11: note_div = 22'd63776;  // high So
            4'd12: note_div = 22'd56818;  // high La
            4'd13: note_div = 22'd50607;  // high Si
            default: note_div = 22'd1;
        endcase
        
endmodule
