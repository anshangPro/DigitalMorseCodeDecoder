`timescale 1ns / 1ps

module mode_switch(
    input clk, rst,
    input mode_sw,
    output reg [23:0] led
);

wire clk_fast;
wire mode_stable;
counter fast(clk, rst, clk_fast);
debounce modesw(clk_fast, rst, mode_sw, mode_stable);
//decoder(mode);
//encoder(~mode);
reg mode; // 1为解码器 0为编码器
always @(posedge mode_stable or posedge rst) begin
    if(rst)begin 
        mode <= 0;
        led[23] <= 0;
    end else begin
        mode <= mode +1;
        led[23] <= led[23] +1;
    end
end
endmodule