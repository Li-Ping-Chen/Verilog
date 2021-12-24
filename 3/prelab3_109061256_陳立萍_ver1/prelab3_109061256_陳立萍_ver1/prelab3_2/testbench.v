`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 22:22:48
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


module test_shift_reg();
    wire [7:0]q;
    reg clk;
    reg rst;
    
shift_reg U0(.q(q), .clk(clk), .rst(rst));

initial
    begin
        #0 clk = 0;
        rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        forever #10 clk = ~clk;
    end
    
endmodule
