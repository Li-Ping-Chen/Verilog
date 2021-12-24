`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/10 13:42:23
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
    input [25:0]key_down,
    output reg [6:0]key_in
);

always @*
    case (key_down)
        27'd67108864 : key_in = 7'd0;    // Caps
        27'd33554432 : key_in = 7'd97;   // a
        27'd16777216 : key_in = 7'd98;   // b
        27'd8388608 : key_in = 7'd99;   // c
        27'd4194304 : key_in = 7'd100;  // d
        27'd2097152 : key_in = 7'd101;  // e
        27'd1048576 : key_in = 7'd102;  // f
        27'd524288 : key_in = 7'd103;  // g
        27'd262144 : key_in = 7'd104;  // h
        27'd131072 : key_in = 7'd105; // i
        27'd65536 : key_in = 7'd106;  // j
        27'd32768 : key_in = 7'd107;  // k
        27'd16384 : key_in = 7'd108;  // l
        27'd8192 : key_in = 7'd109;  // m
        27'd4096 : key_in = 7'd110;  // n
        27'd2048 : key_in = 7'd111;  // o
        27'd1024: key_in = 7'd112;  // p
        27'd512 : key_in = 7'd113;  // q
        27'd256 : key_in = 7'd114;  // r
        27'd128 : key_in = 7'd115;  // s
        27'd64 : key_in = 7'd116;  // t
        27'd32 : key_in = 7'd117;  // u
        27'd16 : key_in = 7'd118;  // v
        27'd8 : key_in = 7'd119;  // w
        27'd4 : key_in = 7'd120;  // x
        27'd2 : key_in = 7'd121;  // y
        27'd1 : key_in = 7'd122;  // z
        default : key_in = 7'd0;
    endcase
            
endmodule
