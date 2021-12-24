`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/10 13:41:12
// Design Name: 
// Module Name: LED
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


module LED(
	input clk,
	input rst_n,
	input [6:0]key_in,
	input mode,
	input shift,
	output reg [6:0]leds
    );
	reg [6:0]leds_next;
	reg [6:0]key_in_now;  // current displayed lower case

	always@(posedge clk or negedge rst_n)
		if (~rst_n) begin
			leds <= 7'd0;
			key_in_now <= 4'd0;
		end
		else if (key_in != 0) begin 
			leds <= leds_next;
			key_in_now <= key_in;
		end
		else leds <= leds_next;

	always @*  
        case (mode)
            2'd0: begin  // upper
            	if (key_in_now <= 0) leds_next <= 0;
            	else if (shift && key_in != 0) leds_next <= key_in_now; // press shift and letter at the same time
            	else leds_next <= key_in_now - 7'd32;   // upper case
            end
            2'd1: begin  // lower
            	if (shift && key_in != 0) leds_next <= key_in_now - 7'd32; // press shift and letter at the same time
            	else leds_next <= key_in_now;  // lower case
            end
            default: begin
            	leds_next <= 7'd0;
        	end
        endcase

endmodule
