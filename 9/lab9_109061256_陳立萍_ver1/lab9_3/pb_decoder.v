`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 19:26:03
// Design Name: 
// Module Name: pb_decoder
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


module pb_decoder(
    input [6:0]keys,
    output reg [3:0]key_in
);

always @*
    case (keys)
        7'h40 : key_in = 4'd6;  // a
        7'h20 : key_in = 4'd7;  // b
        7'h10 : key_in = 4'd1;  // c
        7'h08 : key_in = 4'd2;  // d
        7'h04 : key_in = 4'd3;  // e
        7'h02 : key_in = 4'd4;  // f
        7'h01 : key_in = 4'd5;  // g
        default : key_in = 4'd0;
    endcase
            
endmodule
