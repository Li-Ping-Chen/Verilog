`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/10 15:45:39
// Design Name: 
// Module Name: FSM_time
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


`define STAT_30s 0
`define STAT_60s 1
`define MODE_60s 1
`define MODE_30s 0


module FSM_time(
    input pressed,
    input rst_p,
    input clk,
    output reg [3:0]mode_value_digit0,
    output reg [3:0]mode_value_digit1,
    output reg [3:0]mode_value_digit2
    );
    reg next_state;
    reg mode;
    reg state_mode;

    
always@*
    case (state_mode)
        `STAT_30s:
            if (pressed)  begin
                next_state <= `STAT_60s;
                mode <= `MODE_60s;
            end
            else  begin
                next_state <= `STAT_30s;
                mode <= `MODE_30s;
            end
        `STAT_60s:
            if (pressed)  begin
                next_state <= `STAT_30s;
                mode <= `MODE_30s;
            end
            else  begin
                next_state <= `STAT_60s;
                mode <= `MODE_60s;
            end
        default: begin
            next_state <= `STAT_60s;
            mode <= `MODE_60s;
        end
    endcase
        
always@*
    if (mode == `MODE_60s) begin
        mode_value_digit0 <= 4'd0;
        mode_value_digit1 <= 4'd0;
        mode_value_digit2 <= 4'd1;
    end
    else begin
        mode_value_digit0 <= 4'd0;
        mode_value_digit1 <= 4'd3;
        mode_value_digit2 <= 4'd0;
    end
    
always@(posedge clk)
    state_mode <= next_state;
    
endmodule
