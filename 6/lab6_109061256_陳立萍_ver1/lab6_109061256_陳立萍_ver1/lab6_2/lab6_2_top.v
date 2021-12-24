`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 22:51:35
// Design Name: 
// Module Name: lab6_2_top
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
    input set,      // set time
    input pb_stop,  // start / stop
    input pb_mode,  // pause / resume
    input pb_sec,   // sec button
    input pb_min,   // min button
    input pb_rst,   // reset
    input clk,      // 100Mhz
    output [3:0]dis,
    output [7:0]segs,
    output [15:0]led
    );
    
    wire clk_1hz;
    wire clk_100hz;
    wire sec_debounced;
    wire min_debounced;
    wire mode_debounced;
    wire rst_debounced;
    wire stop_debounced;
    wire sec_pulse;
    wire min_pulse;
    wire mode_pulse;
    wire stop_pulse;
    wire rst_pulse;
    wire rst_pulse_next;
    wire mode;
    wire [3:0]value[5:2];
    
    assign rst_pulse = ~rst_pulse_next;
    
    fre_div_1 clk_1 (.clk(clk),.rst_n(rst_pulse),.clk_out(clk_1hz));
    fre_div_100 clk_100 (.clk(clk),.rst_n(rst_pulse),.clk_out(clk_100hz));
    debounce A0 (.pb_in(pb_mode),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(mode_debounced));
    debounce B0 (.pb_in(pb_rst),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(rst_debounced));
    debounce C0 (.pb_in(pb_min),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(min_debounced));
    debounce D0 (.pb_in(pb_sec),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(sec_debounced));
    debounce E0 (.pb_in(pb_stop),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(stop_debounced));
    one_pulse A1 (.in_trig(mode_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(mode_pulse));
    one_pulse B1 (.in_trig(rst_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(rst_pulse_next));
    one_pulse C1 (.in_trig(min_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(min_pulse));
    one_pulse D1 (.in_trig(sec_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(sec_pulse));
    one_pulse E1 (.in_trig(stop_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(stop_pulse));
    FSM F0 (.pulse(stop_pulse),.clk(clk_100hz),.rst_n(rst_pulse),.resume(mode_pulse),.mode(mode));
    counter_top T1 (.clk_100hz(clk_100hz),.clk_1hz(clk_1hz),.rst_n(rst_pulse),.mode(mode),.set_min_next(min_pulse),.set_sec_next(sec_pulse),
                    .setting_next(set),.val0(value[2]),.val1(value[3]),.val2(value[4]),.val3(value[5]),.led(led),.resume(mode_pulse));
    scan_ctl T0 (.digit3(value[5]),.digit2(value[4]),.digit1(value[3]),.digit0(value[2])
                         ,.clk(clk),.rst_n(rst_pulse),.dis(dis),.segs(segs));

    
    
endmodule
