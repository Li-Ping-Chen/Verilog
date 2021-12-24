`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/06 16:23:53
// Design Name: 
// Module Name: FSM_mode
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


`define state_first 2'd0
`define state_second 2'd1
`define state_enter 2'd2

module FSM_mode(
    input [3:0]key_in,
    input clk,
    input rst_n,
    output reg [1:0]mode,
    output reg [1:0]operator
    );

reg [1:0]state;
reg [1:0]next_state;
 
always@*  begin         
    case (state) //judge state
        `state_first:
            if (key_in == 4'd10 || key_in == 4'd11 || key_in == 4'd12)  begin
                next_state <= `state_second;
                mode <= `state_second;
                if (key_in == 4'd10) operator <= 4'd0;
                else if (key_in == 4'd11) operator <= 4'd1;
                else operator <= 4'd2;
            end
            else  begin
                next_state <= `state_first;
                mode <= `state_first;
            end
        `state_second:
            if (key_in == 4'd13)  begin
                next_state <= `state_enter;
                mode <= `state_enter;
            end
            else begin
                next_state <= `state_second;
                mode <= `state_second;
            end
        default begin
                next_state <= `state_enter;
                mode <= `state_enter;
            end
    endcase
end

always@(posedge clk or negedge rst_n)
    if (~rst_n) state <= `state_first;
    else state <= next_state;

endmodule

