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
input [63:0] seg_in,
output [7:0] seg_en,
output reg [7:0] seg_out
    );
wire clk_slow;
wire clk_fast;
counter slow(clk, rst, clk_fast);  
counter fast(clk_fast, rst, clk_slow);

// reg [2:0] bit; // store the bit which is lighting
reg [2:0] cnt;
reg [7:0] o_seg_en; //0001

assign seg_en = ~o_seg_en;

// always @ (posedge clk_slow or posedge rst) begin
//     if(rst)
//         bit <= 3'b000;
//     else if(bit == 3'b101)
//         bit <= 3'b000;
//     else bit <= bit + 1;
// end

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
    case (cnt)
        3'b111: seg_out = seg_in[7:0];
        3'b000: seg_out = seg_in[15:8];
        3'b001: seg_out = seg_in[23:16];
        3'b010: seg_out = seg_in[31:24];
        3'b011: seg_out = seg_in[39:32];
        3'b100: seg_out = seg_in[47:40];
        3'b101: seg_out = seg_in[55:48];
        3'b110: seg_out = seg_in[63:56];
    endcase;
end
endmodule
