`timescale 1ns / 1ps

module mode_switch(
    input clk, rst,
    input mode_switcher,
    output reg [23:0] led
);
wire clk_fast;
wire mode_switch_stable; 
counter fast(clk, rst, clk_fast);
debounce modesw(clk_fast, rst, mode_switcher, mode_switch_stable);
//decoder( mode, );
//encoder(~mode, );
reg mode; // 0为编码模式 1为解码模式
always @ (posedge mode_switch_stable or posedge rst)begin
    //TODO
    if(rst) begin 
        mode <= 0;
        led[23] <= 0;
    end else begin
        mode <= mode + 1;
        led[23] <= led[23] + 1;
    end
end
endmodule