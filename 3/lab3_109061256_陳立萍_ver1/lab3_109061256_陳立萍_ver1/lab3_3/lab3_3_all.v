`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 23:23:00
// Design Name: 
// Module Name: lab3_3_all
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


module lab3_3_all(f_crystal,rst,q);
    input f_crystal;
    input rst;
    output [3:0]q;

    wire [3:0]q;
    wire f_out;

divide_1hz U0(.f_crys(f_crystal),.rst(rst),.f_out(f_out));

up_counter U1(.q(q), .clk(f_out),.rst(rst));



endmodule
