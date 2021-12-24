`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:25:21
// Design Name: 
// Module Name: display
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


module display(q_7,q_6,q_5,q_4,ssd,D,enable,rst);
input [1:0]enable;
input rst;
input  [7:0]q_7;
input  [7:0]q_6;
input  [7:0]q_5;
input  [7:0]q_4;
output [3:0]ssd;
output [7:0]D;
 
reg [3:0]ssd;
reg [7:0]D;

wire  [7:0]q_7;
wire  [7:0]q_6;
wire  [7:0]q_5;
wire  [7:0]q_4;

always@*
   if (enable == 2'b00 && (~rst))
      begin
         ssd = 4'b0111;
         D = q_7;
      end
   else if (enable == 2'b01 && (~rst))
      begin
         ssd = 4'b1011;
         D = q_6;
      end
   else if (enable == 2'b10 && (~rst))
      begin
         ssd = 4'b1101;
         D = q_5;
      end
   else if (enable == 2'b11 && (~rst))
      begin
         ssd = 4'b1110;
         D = q_4;
      end
   else
      begin
         ssd = 4'b1111;
         D = 8'b11111111;
      end

endmodule
