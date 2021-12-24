`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 11:23:00
// Design Name: 
// Module Name: lab8_3_top
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
    wire [511:0]key_down;
    wire [8:0]last_change;
    wire [3:0]digit[3:0];
    wire [3:0]key_in;
    wire [1:0]operator; 
    wire [1:0]mode;
    wire rst_p;
    wire shift_valid;

    assign rst_p = ~rst_n;
    
    KeyboardDecoder U0 (.PS2_DATA(PS2_DATA),.PS2_CLK(PS2_CLK),.rst(rst_p),.clk(clk)
                        ,.key_down(key_down),.last_change(last_change),.key_valid(key_valid));  
    shift_valid U1 (.clk(clk),.rst_n(rst_n),.keys({key_down[112],key_down[105],key_down[114],key_down[122], 
                   key_down[107],key_down[115],key_down[116],key_down[108],key_down[117],key_down[125]}),.shift_valid(shift_valid));
    pb_decoder U2 (.last_change(last_change),.key_in(key_in));    
    FSM_mode U3 (.key_in(key_in),.clk(clk),.rst_n(rst_n),.mode(mode),.operator(operator));
    calculator U6 (.key_in(key_in),.rst_n(rst_n),.clk(clk),.mode(mode),.operator(operator),.shift_valid(shift_valid),
    			.digit3(digit[3]),.digit2(digit[2]),.digit1(digit[1]),.digit0(digit[0]));
    scan_ctl U7 (.clk(clk),.rst_n(rst_n),.digit3(digit[3]),.digit2(digit[2]),.digit1(digit[1]),.digit0(digit[0])
                    ,.segs(segs),.dis(dis));
    
endmodule
