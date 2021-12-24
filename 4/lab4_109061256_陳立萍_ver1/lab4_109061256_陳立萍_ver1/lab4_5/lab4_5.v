`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:22:59
// Design Name: 
// Module Name: lab4_5
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


module lab4_5(clk,rst,ssd,D);
input clk,rst;
output [3:0]ssd;
output [7:0]D;

wire f_out;
wire [2:0]enable;
wire [7:0]q_7;
wire [7:0]q_6;
wire [7:0]q_5;
wire [7:0]q_4;
wire [7:0]q_3;
wire [7:0]q_2;
wire [7:0]q_1;
wire [7:0]q_0;


divide U1(.clk(clk),.rst(rst),.clk_out(clk_out),.clk_ctl(enable));
shifter U2(.clk(clk_out),.rst(rst),.q_7(q_7),.q_6(q_6),.q_5(q_5),.q_4(q_4));
display U3(.ssd(ssd),.D(D),.enable(enable),.rst(rst),.q_7(q_7),.q_6(q_6),.q_5(q_5),.q_4(q_4));

endmodule
