`timescale 1ns / 1ps

module shift(
    input clk, //backspace or flag
    input rst,
    input direction, //0 for flag , 1 for backspace
    input [7:0] in,
    output reg [63:0] out
);

always @ (posedge clk, posedge rst) begin
    if(rst) begin
        out <= ~0;
    end 
    else if(~direction) begin
        out <= {out[55:0], in};
    end 
    else begin 
        out <= {8'b1111_1111, out[63:8]};
    end
end

endmodule