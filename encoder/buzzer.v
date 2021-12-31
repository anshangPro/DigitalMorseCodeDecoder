`timescale 1ns / 1ps

module buzzer(
	input rst,
    input clk,
    input [74:0]beep_bit,
    input [6:0]wid,
    output beep
    );

	wire clk_02;
	counter #(2000)second1(clk,rst,clk_02);
    counter #(191)second2(clk_02,rst,final_clk);

    wire clk_10000, clk_s02;
    counter full(clk, rst, clk_10000);
    counter #(2000) s02(clk_10000, rst, clk_s02);

    reg [7:0]cnt;

    assign beep = final_clk & beep_bit[cnt] & ~rst & ~cnt[7];
    always @(posedge clk_s02, posedge rst) begin
        if (rst) begin
            cnt <= 0;
        end
        else if(cnt == wid | cnt == 8'b1000_0000) begin
            cnt <= 8'b1000_0000;
        end else cnt <= cnt + 1;
    end
endmodule