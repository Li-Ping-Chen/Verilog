`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 15:35:00
// Design Name: 
// Module Name: lab4
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

module lab4_bonus(
    input globalclk,
    input rst,
    output reg [3:0]dis,
    output [7:0]ssd
    );
    wire clk_ctl;
    wire clk_out;
    wire [3:0]digit[1:0];
    wire br;
    reg [3:0]b;
    wire decrease_enable;

freq_div U0 (.clk(globalclk),.rst(rst),.clk_ctl(clk_ctl),.clk_out(clk_out));
downcounter D1 (.clk(clk_out),.rst(rst),.limit(4'd9),.decrease(decrease_enable),.inivalue(4'd0),.value(digit[0]),.borrow(br));
downcounter D2 (.clk(clk_out),.rst(rst),.limit(4'd2),.decrease(br),.inivalue(4'd3),.value(digit[1]));
display S0 (.b(b),.ssd(ssd));

assign decrease_enable = ~((~rst) && (digit[1] == 4'd0) && (digit[0] == 4'd0));

always @*
    if(rst)
    begin
        dis <= 4'b1111;
        b <= 4'd0;
    end    
    else if (clk_ctl == 0) begin
        dis <= 4'b1101;
        b <= digit[1];
    end
    else begin
        dis <= 4'b1110;
        b <= digit[0];
    end 

endmodule