`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:55:01
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg start_debounced;
    reg rst;
    reg clk_1hz;
    reg clk_100hz;
    wire [3:0]digit0;
    wire [3:0]digit1;
    wire [15:0]led;

    pre_lab5_top T0 (.start_debounced(start_debounced),.rst(rst),.clk_1hz(clk_1hz),.clk_100hz(clk_100hz),.digit0(digit0),.digit1(digit1),.led(led));

 initial
 begin
     clk_1hz = 0;
     forever #5 clk_1hz = ~clk_1hz;
 end
 
 initial 
 begin
     rst = 0;
     start_debounced = 0;
     #20 rst = 1;
     start_debounced = 0;
     #20 rst = 0;
     #95 start_debounced = 1;
     #95 start_debounced = 0;
 end
 
 initial
 begin 
     clk_100hz = 0;
     #5 clk_100hz = 1;
     forever #10 clk_100hz = ~clk_100hz;
 end


endmodule


