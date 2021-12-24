`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/20 22:53:11
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input rst,
    output reg clk_25div128MHz,
    output reg clk_25div4MHz,
    output reg clk_25MHz
    );
    reg cnt0;
    reg cnt1;
    reg [3:0]cnt2;
    reg [8:0]cnt_tmp;

    always @*  
        if ({clk_25div128MHz,cnt2,clk_25div4MHz,cnt1,clk_25MHz,cnt0} >= 9'b111111111) 
            cnt_tmp = 9'b0;
        else cnt_tmp = {clk_25div128MHz,cnt2,clk_25div4MHz,cnt1,clk_25MHz,cnt0} + 9'b1;
    
    always @(posedge clk or posedge rst)
        if (rst) 
            {clk_25div128MHz,cnt2,clk_25div4MHz,cnt1,clk_25MHz,cnt0} <= 9'b000000000; 
        else {clk_25div128MHz,cnt2,clk_25div4MHz,cnt1,clk_25MHz,cnt0} <= cnt_tmp;
        
endmodule
