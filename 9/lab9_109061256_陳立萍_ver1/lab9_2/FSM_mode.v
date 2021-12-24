`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 16:27:25
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


`define state_lower 0
`define state_upper 1

module FSM_mode(
    input pulse,
    input clk,
    input rst_n,
    output reg mode
);
reg mode_next;
    
always @* 
    if (pulse && mode == `state_upper) 
        mode_next = `state_lower;
    else if (pulse && mode == `state_lower) 
        mode_next = `state_upper;
    else 
        mode_next = mode;

always @(posedge clk or negedge rst_n)
    if (~rst_n) mode <= `state_lower;
    else mode <= mode_next;
    
endmodule