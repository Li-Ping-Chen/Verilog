`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/10 13:41:48
// Design Name: 
// Module Name: pulse_valid
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


module pulse_valid(
    input clk,
    input rst_n,
    input keys,
    output reg pulse_valid
    );
    reg key_down_temp;

    always @(posedge clk or negedge rst_n)
        if (~rst_n)  key_down_temp <= 0;
        else key_down_temp <= keys;

    always @*
        if (key_down_temp < keys)  pulse_valid  = 1'd1;
        else  pulse_valid  <= 1'd0;

endmodule
