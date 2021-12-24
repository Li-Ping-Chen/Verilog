`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 15:53:37
// Design Name: 
// Module Name: bin_to_dec
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


module bin_to_dec(
    input [3:0]bin,
    output reg [3:0]digit1,
    output reg [3:0]digit0
    );
    
always @* begin
    digit1 = (bin % 100) / 10;
    digit0 = bin % 10;
end
 
endmodule

