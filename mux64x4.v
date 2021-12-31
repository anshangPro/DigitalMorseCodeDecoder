`timescale 1ns / 1ps

module mux64x4 (
    input [63:0] in1,
    input [63:0] in2,
    input [63:0] in3,
    input [63:0] in4,
    input [1:0] key,
    input rst,
    output reg [63:0] out
    );

    always @ * begin
        if (rst) begin
            out = ~0;
        end else
        case (key) 
            2'b00: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            2'b01: out = in4;
        endcase
    end
    
endmodule