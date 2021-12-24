`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 15:46:02
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


`define S_0 8'b00000011
`define S_1 8'b10011111
`define S_2 8'b00100101
`define S_3 8'b00001101
`define S_4 8'b10011001
`define S_5 8'b01001001
`define S_6 8'b01000001
`define S_7 8'b00011111
`define S_8 8'b00000001
`define S_9 8'b00001001

    
module display(
    input [3:0]bin,
    output reg [7:0]segs
    );
     
always @*  begin
    case (bin)
        4'd0: segs[7:0] <= `S_0;
        4'd1: segs[7:0] <= `S_1;
        4'd2: segs[7:0] <= `S_2;
        4'd3: segs[7:0] <= `S_3;
        4'd4: segs[7:0] <= `S_4;
        4'd5: segs[7:0] <= `S_5;
        4'd6: segs[7:0] <= `S_6;
        4'd7: segs[7:0] <= `S_7;
        4'd8: segs[7:0] <= `S_8;
        4'd9: segs[7:0] <= `S_9;
        default: segs[7:0] <= 8'b11111111;
    endcase
end
    
endmodule
