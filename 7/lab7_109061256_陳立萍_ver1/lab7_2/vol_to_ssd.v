`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 00:24:47
// Design Name: 
// Module Name: vol_to_ssd
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


module vol_to_ssd(
    input [4:0]bin,
    output reg [3:0]digit1,
    output reg [3:0]digit0
    );

always @*
    if (bin <= 5'd9) begin
        digit1 = 4'd0;
        digit0 = bin;
    end
    else if (bin <= 5'd19) begin
        digit1 = 4'd1;
        digit0 = bin - 4'd10;
    end
    else if (bin <= 5'd29) begin
        digit1 = 4'd2;
        digit0 = bin - 5'd20;
    end
    else begin
        digit1 = 4'd3;
        digit0 = bin - 5'd30;
    end
     
endmodule
