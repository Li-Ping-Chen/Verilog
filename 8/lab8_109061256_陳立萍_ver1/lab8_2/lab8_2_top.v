`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 11:21:44
// Design Name: 
// Module Name: lab8_2_top
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
    wire [4:0]sum;
    wire [3:0]sum_digit1;
    wire [3:0]sum_digit0;
    wire [3:0]addend;
    wire [3:0]augend;
    wire shift_valid;
    
    assign rst_p = ~rst_n;
    
    KeyboardDecoder U0 (.PS2_DATA(PS2_DATA),.PS2_CLK(PS2_CLK),.rst(rst_p),.clk(clk)
                        ,.key_down(key_down),.last_change(last_change),.key_valid(key_valid));  
    shift_valid U1 (.clk(clk),.rst_n(rst_n),.keys({key_down[69],key_down[22],key_down[30],key_down[38], 
                    key_down[37],key_down[46],key_down[54],key_down[61],key_down[62],key_down[70]}),.shift_valid(shift_valid));
    pb_decoder U2 (.last_change(last_change),.key_in(key_in));
    shifter_adder U3 (.clk(clk),.rst_n(rst_n),.key_in(key_in),.shift_valid(shift_valid)
                   ,.sum(sum),.addend(addend),.augend(augend));
    bin_to_dec U4 (.bin(sum),.digit1(sum_digit1),.digit0(sum_digit0));
    scan_ctl U5 (.clk(clk),.rst_n(rst_n),.digit3(addend),.digit2(augend),.digit1(sum_digit1),.digit0(sum_digit0)
                    ,.segs(segs),.dis(dis));
    
endmodule
