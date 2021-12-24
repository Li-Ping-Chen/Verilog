`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/23 22:08:26
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


module test_up_counter();
    reg clk;
    reg rst;
    wire [3:0]q;
    
up_counter U0(.clk(clk), .rst(rst), .q(q));

initial 
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
initial 
    begin
        rst = 0;
        #20 rst = 1;
    end
    
endmodule
