`timescale 1ns / 1ps

module mux64 (
    input switch,
    input [63:0] in1,
    input [63:0] in2,
    input rst,
    output reg [63:0] out
    );

    always @* begin
        if (rst) begin
            out = ~0;
        end else
        if(switch) out = in1;
        else out = in2;
    end

endmodule