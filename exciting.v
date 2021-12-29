`timescale 1ns / 1ps

module exciting(
    input clk,
    input switch,
    output signal
);


reg lag1, lag2;

always @ (posedge clk) begin
    lag1 <= switch;
    lag2 <= lag1;
end

assign signal = lag1 & ~lag2;

endmodule