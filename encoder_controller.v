`timescale 1ns / 1ps

module encoder_controller (
    input en, clk, rst, backspace_button, flag,
    input [3:0] key,
    output [63:0] seg_out
);

register regist(backspace_button, clk, rst, key, flag, seg_out);
encoder enc(en, clk, rst, key);
    
endmodule