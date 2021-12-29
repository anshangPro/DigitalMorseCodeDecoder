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

    reg [6:0]cnt;

    assign beep = final_clk & beep_bit[cnt] & ~rst;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            cnt <= 0;
        end
        else begin
            if (cnt != wid) begin
                cnt <= cnt + 1;
            end
            else begin
                cnt <= 0;
            end
        end
    end
endmodule