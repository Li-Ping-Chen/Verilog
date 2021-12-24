`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:14:22
// Design Name: 
// Module Name: lab4_4
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


module lab4_4(rst, b, D, ssd, f_crys);
input rst;
input f_crys;
output [3:0]b;
output [7:0]D;
output [3:0]ssd;

wire [3:0]b;
wire f_out;

divide_1hz U0(.f_crys(f_crys),.rst(rst),.f_out(f_out));
BCD_down U1(.clk(f_out),.rst(rst),.b(b));
display U2(.b(b),.D(D));

assign ssd = 4'b1110;

endmodule
