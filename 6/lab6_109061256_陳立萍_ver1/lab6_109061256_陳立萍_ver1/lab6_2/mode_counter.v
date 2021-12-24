`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 00:43:33
// Design Name: 
// Module Name: mode_counter
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


module mode_counter(
    input in_trig,
    input clk,
    input rst_p,
    output reg mode_pulse
    );
    reg [6:0]mode_counter;
    reg [6:0]mode_counter_temp;
    
always @*
    if (mode_counter >= 7'd100) begin
        mode_counter_temp <= 7'b0;
        mode_pulse <= 1'b1;
    end
    else if (in_trig) begin 
        mode_counter_temp <= mode_counter + 7'd1;
        mode_pulse <= 1'b0;
    end
    else begin 
        mode_counter_temp <= 7'b0;
        mode_pulse <= 1'b0;
    end
        
always @(posedge clk or posedge rst_p)
    if (rst_p)  mode_counter <= 7'b0; 
    else mode_counter <= mode_counter_temp;
        
endmodule
