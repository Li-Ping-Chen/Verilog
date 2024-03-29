`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 22:47:49
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


`define STATE_START 1
`define STATE_PAUSE 0
`define MODE_START 1
`define MODE_PAUSE 0
     
module FSM(
    input resume,
    input pulse,
    input clk,
    input rst_n,
    output reg mode
);

reg next_state;
reg state;     

always@*  begin
    if (state == `STATE_START) 
        mode <= `MODE_START;
    else mode <= `MODE_PAUSE;          
    case (state)
        `STATE_PAUSE:  begin
            if (pulse)
                next_state <= `STATE_START;
            else next_state <= `STATE_PAUSE;
            end
        `STATE_START: begin
             if (pulse)
                 next_state <= `STATE_PAUSE;
             else next_state <= `STATE_START;
             end
    endcase
    end
    
always@(posedge clk or negedge rst_n)
    if (~rst_n)  state <= `STATE_PAUSE;
    else if (resume) state <= `STATE_PAUSE;
    else state <= next_state;

endmodule

