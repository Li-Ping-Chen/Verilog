`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 11:26:41
// Design Name: 
// Module Name: lab8_4_top
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
    output [6:0]leds,
    output caps_led
    );
	wire [511:0]key_down;
    wire [8:0]last_change;
	wire [6:0]key_in;
	wire mode;
	wire caps_valid;

	assign rst_p = ~rst_n;
    
    KeyboardDecoder U0(.PS2_DATA(PS2_DATA),.PS2_CLK(PS2_CLK),.rst(rst_p),.clk(clk)
                        ,.key_down(key_down),.last_change(last_change),.key_valid(key_valid));  
	pb_decoder U1(.key_down({key_down[28],key_down[50],key_down[33],key_down[35], 
                        key_down[36],key_down[43],key_down[52],key_down[51],key_down[67],key_down[59],key_down[66]
                        ,key_down[75],key_down[58],key_down[49],key_down[68],key_down[77],key_down[21],key_down[45]
                        ,key_down[27],key_down[44],key_down[60],key_down[42],key_down[29],key_down[34],key_down[53]
                        ,key_down[26]}),.key_in(key_in));
	pulse_valid U2(.clk(clk),.rst_n(rst_n),.keys(key_down[88]),.pulse_valid(caps_valid));
	FSM U3(.caps_valid(caps_valid),.clk(clk),.rst_n(rst_n),.mode(mode),.caps_led(caps_led));
	LED U4(.clk(clk),.rst_n(rst_n),.key_in(key_in),.shift(key_down[18]),.mode(mode),.leds(leds));
	
endmodule
