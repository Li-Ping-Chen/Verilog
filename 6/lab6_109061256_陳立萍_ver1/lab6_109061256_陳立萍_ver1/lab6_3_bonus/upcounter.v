`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 23:52:24
// Design Name: 
// Module Name: upcounter
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


module upcounter(
    input [3:0]inivalue,
    input [3:0]highbound,
    input [3:0]lowbound,
    input increase,
    input time_rst,
    input [3:0]time_rst_value,
    input clk,
    input rst_n,
    output reg [3:0]value,
    output reg increment
    );
reg [3:0]value_next;
reg [3:0]value_in;
    
always@*   // judge next value
    if (value >= highbound && increase)
        value_next <= lowbound;
    else if (increase)
        value_next <= value + 4'd1;
    else 
        value_next <= value;
            
always@*
    if (time_rst)  value_in <= time_rst_value;
    else value_in <= value_next;
        
always@(posedge clk or negedge rst_n)  // reset
    if (~rst_n)  value <= inivalue;
    else value <= value_in;
        
always@*  // give increment to upper number
    if (value >= highbound && increase)
        increment <= 1'd1;
    else
        increment <= 1'd0; 
        
endmodule
