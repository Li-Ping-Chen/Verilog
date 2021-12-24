`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 00:00:51
// Design Name: 
// Module Name: lab5_2
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


module top(
    input pb_start,
    input clk_cr,
    output [7:0]seg,
    output [3:0]dis,
    output reg [15:0]led
    );
    wire clk_100hz;
    wire clk_1hz;
    wire rst_p;
    wire start_debounced;
    wire start_pulse;
    reg count_enable;
    wire count_enable_next;
    wire [3:0]digit[1:0];
    wire [3:0]bin;
    wire br;
    
    
    fre_div_1  C0 (.clk(clk_cr),.rst_p(rst_p),.clk_out(clk_1hz));
    fre_div_100  C1 (.clk(clk_cr),.rst_p(rst_p),.clk_out(clk_100hz));
    debounce  P0 (.pb_in(pb_start),.clk(clk_100hz),.rst_p(rst_p),.pb_debounced(start_debounced));
    one_pulse P2 (.in_trig(start_debounced),.clk(clk_100hz),.rst_p(rst_p),.one_pulse(start_pulse));
    reset_counter P3 (.in_trig(start_debounced),.clk(clk_100hz),.rst_p(rst_p),.rst_pulse(rst_p));
    FSM  P4 (.pressed(start_pulse),.rst_p(rst_p),.clk(clk_100hz),.count_enable(count_enable_next));
    downcounter  D0 (.clk(clk_1hz),.rst_p(rst_p),.limit(4'd9),.decrease(count_enable),.inivalue(4'd0),.value(digit[0]),.borrow(br));
    downcounter  D1 (.clk(clk_1hz),.rst_p(rst_p),.limit(4'd2),.decrease(br),.inivalue(4'd3),.value(digit[1]));
    scan_ctl  C2 (.digit3(4'b0),.digit2(4'b0),.digit1(digit[1]),.digit0(digit[0]),.clk(clk_cr),.rst_p(rst_p),.dis(dis),.bin_out(bin)); 
    display  P5 (.bin(bin),.segs(seg));
    
    always @*  begin
        led <= 4'd0;
        led[0] <= count_enable;
        if (rst_p)  begin
            led <= 4'd0;
            count_enable <= count_enable_next;
        end
        else if (digit[1] == 0 && digit[0] == 0) begin
            led[15:0] <= 16'b11111111_11111111;
            count_enable <= 1'b0;
        end
        else begin
            led <= 4'd0;
            count_enable <= count_enable_next;
        end
    end
endmodule
