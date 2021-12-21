`timescale 1ns / 1ps

module seg(
input clk,
input rst,
input [63:0] seg_in,
output [7:0] seg_en,
output reg [7:0] seg_out
    );
wire clk_fast;
counter fast(clk, rst, clk_fast);

reg [2:0] cnt;
reg [7:0] o_seg_en;

assign seg_en = ~o_seg_en;

always @ (posedge clk_fast or posedge rst) begin
    if(rst) begin
        cnt <= 3'b000;
    end
    else begin
        if(cnt == 3'b111) cnt <= 3'b000;
        else cnt <= cnt + 3'b001;
    end 
end

always @ (posedge clk) begin
    case (cnt)
        3'b000: begin 
                    seg_out <= seg_in[63:56];
                    o_seg_en <= 8'b1000_0000;
                end
        3'b001: begin 
                    seg_out <= seg_in[55:48];
                    o_seg_en <= 8'b0100_0000;
                end
        3'b010: begin 
                    seg_out <= seg_in[47:40];
                    o_seg_en <= 8'b0010_0000;
                end
        3'b011: begin 
                    seg_out <= seg_in[39:32];
                    o_seg_en <= 8'b0001_0000;
                end
        3'b100: begin 
                    seg_out <= seg_in[31:24];
                    o_seg_en <= 8'b0000_1000;
                end
        3'b101: begin 
                    seg_out <= seg_in[23:16];
                    o_seg_en <= 8'b0000_0100;
                end
        3'b110: begin 
                    seg_out <= seg_in[15:8];
                    o_seg_en <= 8'b0000_0010;
                end
        3'b111: begin
                    seg_out <= seg_in[7:0];
                    o_seg_en <= 8'b0000_0001;
                end
    endcase
end
endmodule
