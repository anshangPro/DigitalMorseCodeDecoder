`timescale 1ns / 1ps

module encoder_controller (
    input en, clk, rst, backspace_button, flag,
    input [8:0] encoder_switch,
    input [3:0] key,
    output [63:0] seg_out
);

wire [4:0] morse_cord;
wire [63:0] seg_out_temp;
register regist(en,clk, flag,backspace_button, rst, key,  seg_out);
assign seg_out_temp = seg_out;
encoder_basic encb(en, clk,encoder_switch , rst, seg_out_temp,morse_cord);
    
endmodule
