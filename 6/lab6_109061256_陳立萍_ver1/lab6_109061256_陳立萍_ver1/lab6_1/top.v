`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 18:44:44
// Design Name: 
// Module Name: top
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
    input pb_lap,    // lap
    input pb_start,  // start/stop
    input pb_rst,    // reset
    input clk,       // global clock
    output [3:0]dis,
    output [7:0]segs
    );
    
    wire clk_1hz;
    wire clk_100hz;
    wire lap_debounced;
    wire start_debounced;
    wire rst_debounced;
    wire lap_pulse;
    wire start_pulse;
    wire rst_pulse_next;
    wire rst_pulse;
    wire memory;
    wire mode;
    wire [3:0]value[3:0];
    wire [3:0]memory_value[3:0];
    
    assign rst_pulse = ~rst_pulse_next;  
    
    fre_div_1 U1 (.clk(clk),.rst_n(rst_pulse),.clk_out(clk_1hz));
    fre_div_100 U2 (.clk(clk),.rst_n(rst_pulse),.clk_out(clk_100hz));
    debounce A0 (.pb_in(pb_lap),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(lap_debounced));
    debounce B0 (.pb_in(pb_start),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(start_debounced));
    debounce C0 (.pb_in(pb_rst),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(rst_debounced));
    one_pulse A1 (.in_trig(lap_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(lap_pulse));
    one_pulse B1 (.in_trig(start_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(start_pulse));
    one_pulse C1 (.in_trig(rst_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(rst_pulse_next));
    fsm_lap fsm_1 (.pulse(lap_pulse),.clk(clk_100hz),.rst_n(rst_pulse),.memory(memory));
    fsm_start fsm_2 (.pulse(start_pulse),.clk(clk_100hz),.rst_n(rst_pulse),.mode(mode));
    upcounter_top D0 (.clk(clk_1hz),.rst_n(rst_pulse),.mode(mode),.value0_1h(value[0]),.value1_1h(value[1]),.value2_1h(value[2]),.value3_1h(value[3]));
    memory U0 (.clk(clk_100hz),.rst_n(rst_pulse),.memory(memory)
                     ,.value0_in(value[0]),.value1_in(value[1]),.value2_in(value[2]),.value3_in(value[3])
                     ,.value0_out(memory_value[0]),.value1_out(memory_value[1]),.value2_out(memory_value[2]),.value3_out(memory_value[3]));
    scan_ctl T1 (.digit3(memory_value[3]),.digit2(memory_value[2]),.digit1(memory_value[1]),.digit0(memory_value[0])
                         ,.clk(clk),.rst_n(rst_pulse),.dis(dis),.segs(segs));

    
endmodule