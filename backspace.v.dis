`timescale 1ns / 1ps

module backspace(
input backspace_button,
input clk,
input rst,
input [63:0] seg_in,
output reg [63:0] seg_out
    );
    always @(posedge clk,negedge rst) begin
        if (~rst) 
        begin
            seg_out <= seg_in;
        end 
        else begin
            if (seg_out[7:0]!=8'b0)
            begin
                seg_out <= {8'b0,seg_out[63:8]};
            end
        end
    end
endmodule
