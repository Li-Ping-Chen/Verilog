`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 11:30:00
// Design Name: 
// Module Name: FSM
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


`define STAT_PAUSE 0
`define STAT_START 1
`define ENABLED 1
`define DISABLED 0

module FSM(
    input pressed, //push button
    input rst_p,
    input clk,
    output reg count_enable
    );
    reg next_state;
    reg state;
    
always@*
    case (state)  // state judge
        `STAT_PAUSE:
            if (pressed)  begin
                next_state <= `STAT_START;
                count_enable <= `ENABLED;
            end
            else  begin
                next_state <= `STAT_PAUSE;
                count_enable <= `DISABLED;
            end
        `STAT_START:
            if (pressed)  begin
                next_state <= `STAT_PAUSE;
                count_enable <= `DISABLED;
            end
            else  begin
                next_state <= `STAT_START;
                count_enable <= `ENABLED;
            end
        default:
            begin
                next_state <= `STAT_START;
                count_enable <= `ENABLED;
            end
        endcase
        
always @(posedge clk or posedge rst_p)
    if (rst_p)  state <= `STAT_PAUSE;
    else state <= next_state;
    
endmodule
