`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/06 21:42:37
// Design Name: 
// Module Name: calculator
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


module calculator(
    input rst_n,
    input [3:0]key_in,
    input clk,
    input [1:0]mode,
    input [1:0]operator,
    input shift_valid,
    output reg[3:0]digit3,
    output reg[3:0]digit2,
    output reg [3:0]digit1,
    output reg [3:0]digit0
    );
	wire [3:0]digit_tmp[3:0];
	wire [3:0]first_digit[1:0];
    wire [3:0]second_digit[1:0];
    wire [6:0]first;
    wire [6:0]second;
	wire shift_valid_first;
    wire shift_valid_second;
    reg [13:0]answer;
    reg sign;
    
    assign shift_valid_first = shift_valid && (mode == 2'd0);
    assign shift_valid_second = shift_valid && (mode == 2'd1);
    
    shifter U0 (.clk(clk),.rst_n(rst_n),.key_in(key_in),.shift_valid(shift_valid_first),
                .ten_tmp(first_digit[1]),.one_tmp(first_digit[0]));
    shifter U1 (.clk(clk),.rst_n(rst_n),.key_in(key_in),.shift_valid(shift_valid_second),
                .ten_tmp(second_digit[1]),.one_tmp(second_digit[0]));
    dec_to_bin A0 (.digit1(first_digit[1]),.digit0(first_digit[0]),.bin(first));
    dec_to_bin A1 (.digit1(second_digit[1]),.digit0(second_digit[0]),.bin(second));
    bin_to_dec T0 (.bin(answer),.sign(sign),.digit3(digit_tmp[3]),
    			  .digit2(digit_tmp[2]),.digit1(digit_tmp[1]),.digit0(digit_tmp[0]));

    always @*  
        case (mode)        	
            2'd0: begin 
                digit3 <= 4'd0;
                digit2 <= 4'd0;
                digit1 <= first_digit[1];
                digit0 <= first_digit[0];
            end
            2'd1: begin
                digit3 <= 4'd0;
                digit2 <= 4'd0;
                digit1 <= second_digit[1];
                digit0 <= second_digit[0];
            end
            2'd2: begin
            	case (operator)
                    2'd0: begin // +
                        answer = first + second;
                        sign = 0;
                    end
                    2'd1: begin // -
                        if (first >= second) begin
                            answer = first - second;
                            sign = 0;
                        end
                        else begin
                            answer = second - first;
                            sign = 1;
                        end
                    end
                    2'd2: begin // *
                        answer = first * second;
                        sign = 0;
                    end
                    default : answer = 14'd7;
                endcase
                digit3 <= digit_tmp[3];
                digit2 <= digit_tmp[2];
                digit1 <= digit_tmp[1];
                digit0 <= digit_tmp[0]; 
            end
            default begin
                digit3 <= 0;
                digit2 <= 0;
                digit1 <= 0;
                digit0 <= 0; 
            end
        endcase  

endmodule
