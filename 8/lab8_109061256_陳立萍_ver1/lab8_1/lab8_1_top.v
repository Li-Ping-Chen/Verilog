`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 11:18:13
// Design Name: 
// Module Name: lab8_1_top
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


module top(
	inout PS2_DATA,
    inout PS2_CLK,
    input rst_n,
    input clk,
    output [7:0]segs,
    output [3:0]dis
    );
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    wire rst_p;
    wire [3:0]key_in;
    
    assign rst_p = ~rst_n;
    
    KeyboardDecoder U0 (.PS2_DATA(PS2_DATA),.PS2_CLK(PS2_CLK),.rst(rst_p),.clk(clk)
                        ,.key_down(key_down),.last_change(last_change),.key_valid(key_valid));
    pb_decoder U1 (.last_change(last_change),.key_in(key_in));
    scan_ctl U2 (.clk(clk),.rst_n(rst_n),.digit3(4'd15),.digit2(4'd15),.digit1(4'd15),.digit0(key_in)
                    ,.segs(segs),.dis(dis));
    
endmodule
