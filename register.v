`timescale 1ns / 1ps

module register (
    input clk,
    input flag,
    input backspace_button,
    input rst,
    input [3:0] keyboard_val,
    output [63:0] seg_out,
    output [63:0] seg_out_same
);

    //mode = 1 -> backspace
    //mode = 0 -> flag
    reg mode;
    always @ (posedge clk, posedge rst) begin
            if(rst) begin
                mode <= 0;
            end
            else if (backspace_button) begin 
                mode <= 1;
            end
            else begin 
                mode <= 0;
            end
    end

    wire[7:0] val;
    //transfer trans(clk, rst, keyboard_val, val);
    shift shift(clk, rst, flag, backspace_button, mode, keyboard_val, seg_out);
    assign seg_out_same = seg_out;

endmodule
