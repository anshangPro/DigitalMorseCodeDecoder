`timescale 1ns / 1ps

module encoder_controller (
    input en, clk, rst, backspace_button, flag,
    input [7:0] encoder_switch,
    input [3:0] key,
    output [63:0] seg_out
);

wire [4:0] morse_cord;
register regist(en,flag,backspace_button, rst, key,  seg_out);
encoder enc(en, encoder_switch , rst, key,morse_cord);
    
endmodule
