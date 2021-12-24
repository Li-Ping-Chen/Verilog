`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 21:40:40
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
            9'h45: key_in = 4'd0;
            9'h16: key_in = 4'd1;
            9'h1E: key_in = 4'd2;
            9'h26: key_in = 4'd3;
            9'h25: key_in = 4'd4;
            9'h2E: key_in = 4'd5;
            9'h36: key_in = 4'd6;
            9'h3D: key_in = 4'd7;
            9'h3E: key_in = 4'd8;
            9'h46: key_in = 4'd9;
            default : key_in = 4'd15;
        endcase
                
endmodule
