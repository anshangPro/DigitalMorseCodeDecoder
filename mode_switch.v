`timescale 1ns / 1ps

module mode_switch(
    input clk, rst,
    input mode_sw,
    input [3:0] row,
    output reg [3:0] col,
    output reg [23:0] led
);

wire clk_fast;
wire mode_stable;
counter fast(clk, rst, clk_fast);
debounce modesw(clk_fast, rst, mode_sw, mode_stable);
//decoder(mode);
//encoder(~mode);
reg mode; // 1Îª½âÂëÆ÷ 0Îª±àÂëÆ÷
always @(posedge mode_stable or posedge rst) begin
    if(rst)begin 
        mode <= 0;
        led[23] <= 0;
    end else begin
        mode <= mode +1;
        led[23] <= led[23] +1;
    end
end

wire [3:0] value;
wire key_flag;
wire [4:0] morse_cord;
key_board key(clk, rst, row, col, value, key_flag);
encoder encode(~mode, clk, rst, value, morse_cord);
endmodule