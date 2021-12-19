`timescale 1ns / 1ps

module register(
input clk,
input rst,
input [3:0] keyboard_val,
output reg [63:0] seg_in
    );
    wire seg_out;
    display u(clk,rst,keyboard_val,seg_out);
    always @(posedge clk,negedge rst) begin
        if (~rst) 
        begin
            seg_in = 64'b0;
        end 
        else begin
            if (seg_in[63:56]==8'b0)
            begin
                seg_in <= {seg_in[55:0],seg_out};
            end
        end
    end
endmodule