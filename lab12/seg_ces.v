`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/03 15:03:30
// Design Name: 
// Module Name: seg_ces
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


module seg_ces(
input clk,
input rst,
output [7:0] seg_en,
output reg [7:0] seg_out
    );
wire clk_slow;
wire clk_fast;
counter slow(clk, rst, clk_fast);  
counter fast(clk_fast, rst, clk_slow);
parameter c = 8'b11000110;
parameter s = 8'b10010010;
parameter e = 8'b10000110;
reg [2:0] bit; // store the bit which is lighting
reg [2:0] cnt;
reg [7:0] o_seg_en; //0001

assign seg_en = ~o_seg_en;

always @ (posedge clk_slow or posedge rst) begin
    if(rst)
        bit <= 3'b000;
    else if(bit == 3'b101)
        bit <= 3'b000;
    else bit <= bit + 1;
end

always @ (posedge clk_fast or posedge rst) begin
    if(rst)
        o_seg_en <= 8'b00000001;
    else if(o_seg_en == 8'b10000000) begin
        o_seg_en <= 8'b00000001;
    end
    else o_seg_en <= o_seg_en<<1;
end

always @ (posedge clk_fast or posedge rst)begin
    if(rst)
        cnt <= 3'b000;
    else if(cnt == 3'b111)
        cnt <= 3'b000;
    else cnt <= cnt + 3'b001;
end

always @ (posedge clk_fast) begin
    if(cnt == bit + 3'b000) seg_out <= e;
    else if(cnt == bit + 3'b001) seg_out <= s;
    else if(cnt == bit + 3'b010) seg_out <= c;
    else seg_out <= 8'b11111111;
end
endmodule
