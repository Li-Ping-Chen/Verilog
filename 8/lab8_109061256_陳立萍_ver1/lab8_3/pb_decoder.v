`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 23:06:04
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
    input [8:0]last_change,
    output reg [3:0]key_in
    );
    
    always @*
        case (last_change)
            9'h70: key_in = 4'd0;
            9'h69: key_in = 4'd1;
            9'h72: key_in = 4'd2;
            9'h7A: key_in = 4'd3;
            9'h6B: key_in = 4'd4;
            9'h73: key_in = 4'd5;
            9'h74: key_in = 4'd6;
            9'h6C: key_in = 4'd7;
            9'h75: key_in = 4'd8;
            9'h7D: key_in = 4'd9;
            9'h79: key_in = 4'd10;  // +
            9'h7B: key_in = 4'd11;  // -
            9'h7C: key_in = 4'd12;  // *
            9'h5A: key_in = 4'd13;  // Enter
            default : key_in = 4'd15;
        endcase
                
endmodule