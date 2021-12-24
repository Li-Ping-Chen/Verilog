`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/10 15:43:53
// Design Name: 
// Module Name: downcounter
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


`define ENABLED 1
`define DISABLED 0
`define INCREMENT 1

module downcounter(
output reg [3:0]value,
output reg borrow,
input [3:0]inivalue,
input clk,
input rst_p,
input decrease,
input [3:0]limit
);
reg [3:0]value_tmp;

always @*
    if (value == 0 && decrease)
    begin
      value_tmp = limit;
      borrow = `ENABLED;
    end
    else if (value != 0 && decrease)
    begin
        value_tmp = value - `INCREMENT;
        borrow = `DISABLED;
    end
    else
    begin
        value_tmp = value;
        borrow = `DISABLED;
    end

always @(posedge clk or posedge rst_p)
    if (rst_p)
        value <= inivalue;
    else 
        value <= value_tmp;
        
endmodule
