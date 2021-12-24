`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 23:34:49
// Design Name: 
// Module Name: lab3_4_all
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


module lab3_4_all(f_crystal,rst,q);
input f_crystal;
input rst;
output [7:0]q;


wire [7:0]q;
wire f_out;

divide_1hz U0(.f_crys(f_crystal),.rst(rst),.f_out(f_out));

shift_reg U1(.q(q),.clk(f_out),.rst(rst));



endmodule
