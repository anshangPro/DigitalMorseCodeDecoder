`timescale 1ns / 1ps

module seg(
input clk,
input rst,
input [63:0] seg_in,
output reg [7:0] o_seg_en,
output reg [7:0] seg_out
    );
wire clk_fast;
counter fast(clk, rst, clk_fast);
wire clk_slow;
counter #(20) slow(clk_fast, rst, clk_slow);

reg [2:0] cnt;

always @ (posedge clk_slow or posedge rst) begin
    if(rst) begin
        cnt <= 3'b000;
    end
    else begin
        if(cnt == 3'b111) cnt <= 3'b000;
        else cnt <= cnt + 3'b001;
    end 
    case (cnt)
        3'b000: begin 
                    seg_out <= seg_in[63:56];
                    o_seg_en <= 8'b0111_1111;
                end
        3'b001: begin 
                    seg_out <= seg_in[55:48];
                    o_seg_en <= 8'b1011_1111;
                end
        3'b010: begin 
                    seg_out <= seg_in[47:40];
                    o_seg_en <= 8'b1101_1111;
                end
        3'b011: begin 
                    seg_out <= seg_in[39:32];
                    o_seg_en <= 8'b1110_1111;
                end
        3'b100: begin 
                    seg_out <= seg_in[31:24];
                    o_seg_en <= 8'b1111_0111;
                end
        3'b101: begin 
                    seg_out <= seg_in[23:16];
                    o_seg_en <= 8'b1111_1011;
                end
        3'b110: begin 
                    seg_out <= seg_in[15:8];
                    o_seg_en <= 8'b1111_1101;
                end
        3'b111: begin
                    seg_out <= seg_in[7:0];
                    o_seg_en <= 8'b1111_1110;
                end
    endcase
end
endmodule
