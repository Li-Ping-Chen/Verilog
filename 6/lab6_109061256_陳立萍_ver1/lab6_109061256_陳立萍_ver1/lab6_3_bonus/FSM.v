`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 23:49:34
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
    input pulse,
    input clk,
    input rst_n,
    input setting,
    input set_on,
    output reg mode
);

reg next_state;
reg state;     

always@*  begin
    if (state == `STATE_START) 
        mode <= `MODE_START;
    else mode <= `MODE_PAUSE;
    if(~setting) begin          
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
            default next_state <= `STATE_PAUSE;
        endcase
    end
    
    else next_state <= `STATE_PAUSE;
    end
    
always@(posedge clk or negedge rst_n)
    if (~rst_n)  state <= `STATE_PAUSE;
    else if (set_on) state <= `STATE_PAUSE;
    else state <= next_state;

endmodule