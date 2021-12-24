`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/07 15:46:17
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


`define state_upper 0
`define state_lower 1

module FSM(
    input caps_valid,
    input clk,
    input rst_n,
    output reg mode,
    output reg caps_led
    );

reg state;
reg next_state;
 
always@*  begin         
    case (state) //judge state
        `state_lower:
            if (caps_valid) begin
                next_state <= `state_upper;
                mode <= `state_upper;
                caps_led <= 1;
            end
            else  begin
                next_state <= `state_lower;
                mode <= `state_lower;
                caps_led <= 0;
            end
        `state_upper:
            if (caps_valid)  begin
                next_state <= `state_lower;
                mode <= `state_lower;
                caps_led <= 0;
            end
            else  begin
                next_state <= `state_upper;
                mode <= `state_upper;
                caps_led <= 1;
            end
        default begin
                next_state <= `state_lower;
                mode <= `state_lower;
                caps_led <= 0;
            end
    endcase
end

always@(posedge clk or negedge rst_n)
    if (~rst_n) state <= `state_lower;
    else state <= next_state;

endmodule
