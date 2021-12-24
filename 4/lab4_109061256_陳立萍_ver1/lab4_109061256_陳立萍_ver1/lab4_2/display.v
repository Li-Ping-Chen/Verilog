`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 23:12:25
// Design Name: 
// Module Name: display
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


`define D_0 8'b00000011
`define D_1 8'b10011111
`define D_2 8'b00100101
`define D_3 8'b00001101
`define D_4 8'b10011001
`define D_5 8'b01001001
`define D_6 8'b01000001
`define D_7 8'b00011111
`define D_8 8'b00000001
`define D_9 8'b00001001
`define D_a 8'b00010001
`define D_b 8'b11000001
`define D_c 8'b01100011
`define D_d 8'b10000101
`define D_e 8'b01100001
`define D_f 8'b01110001

module display(b,D);
input [3:0]b;
output [7:0]D;
reg [7:0]D;

always@*
 case(b)
    4'd0 : D = `D_0;
    4'd1 : D = `D_1;
    4'd2 : D = `D_2;
    4'd3 : D = `D_3;
    4'd4 : D = `D_4;
    4'd5 : D = `D_5;
    4'd6 : D = `D_6;
    4'd7 : D = `D_7;
    4'd8 : D = `D_8;
    4'd9 : D = `D_9;
    4'd10 : D = `D_a;
    4'd11 : D = `D_b;
    4'd12 : D = `D_c;
    4'd13 : D = `D_d;
    4'd14 : D = `D_e;
    4'd15 : D = `D_f;
default : D = 8'b00000000;
endcase

endmodule
