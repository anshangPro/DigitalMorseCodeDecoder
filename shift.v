`timescale 1ns / 1ps

module shift(
    input clk, //backspace or flag
    input rst,
    input flag,
    input bs_button,
    input direction, //0 for flag , 1 for backspace
    input [7:0] in,
    output reg [63:0] out
);
    reg bs_lag1;
    reg flag_lag1;
    always @ (posedge clk) begin
        bs_lag1  <= bs_button;
        flag_lag1 <= flag;
    end

    reg bs_lag2;
    reg flag_lag2;
    always @ (posedge clk) begin
        bs_lag2  <= bs_lag1;
        flag_lag2 <= flag_lag1;
    end

    reg bs_lag3;
    reg flag_lag3;
    always @ (posedge clk) begin
        bs_lag3  <= bs_lag2;
        flag_lag3 <= flag_lag2;
    end

always @ (posedge clk, posedge rst) begin
    if(rst) begin
        out <= ~0;
    end 
    else if(~direction) begin
        if(flag_lag2 & ~flag_lag3) out <= {out[55:0], in};
    end 
    else begin 
        if(bs_lag2 & ~bs_lag3)out <= {8'b1111_1111, out[63:8]};
    end
end

endmodule