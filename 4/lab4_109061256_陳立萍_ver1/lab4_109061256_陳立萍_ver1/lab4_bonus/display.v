`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 15:34:45
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

    
module display(
    input [3:0]b,
    output reg [7:0]ssd
    ); 
    
    
always @*
    case (b)
        4'd0: ssd = `D_0;
        4'd1: ssd = `D_1;
        4'd2: ssd = `D_2;
        4'd3: ssd = `D_3;
        4'd4: ssd = `D_4;
        4'd5: ssd = `D_5;
        4'd6: ssd = `D_6;
        4'd7: ssd = `D_7;
        4'd8: ssd = `D_8;
        4'd9: ssd = `D_9;
        default: ssd = 8'b00000000;
    endcase
endmodule