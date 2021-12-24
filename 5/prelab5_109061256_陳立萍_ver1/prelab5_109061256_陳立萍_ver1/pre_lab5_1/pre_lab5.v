`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 00:50:04
// Design Name: 
// Module Name: pre_lab5
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


module pre_lab5_top(
    input start_debounced,
    input rst,
    input clk_1hz,
    input clk_100hz,
    output [3:0]digit1,
    output [3:0]digit0,
    output reg [15:0]led
    );
    wire start_pulse;
    reg count_enable;
    wire count_enable_next;
    wire br;
    
    one_pulse U0(.in_trig(start_debounced),.clk(clk_100hz),.rst(rst),.one_pulse(start_pulse));
    FSM U1(.pressed(start_pulse),.rst(rst),.clk(clk_100hz),.count_enable(count_enable_next));
    downcounter  D0(.clk(clk_1hz),.rst(rst),.limit(4'd9),.decrease(count_enable),.inivalue(4'd0),.value(digit0),.borrow(br));
    downcounter  D1(.clk(clk_1hz),.rst(rst),.limit(4'd2),.decrease(br),.inivalue(4'd3),.value(digit1));
    
always @*
    if (rst)  
        begin
            led <= 16'b0;
            count_enable <= count_enable_next;
        end
    else if (digit1 == 0 && digit0 == 0) 
        begin
            led <= 16'b1111111111111111;
            count_enable <= 1'b0;
        end
    else 
        begin
            led <= 16'b0;
            count_enable <= count_enable_next;
        end
endmodule
