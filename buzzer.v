`timescale 1ns / 1ps

module buzzer(
    input en,
	input rst,
    input clk,
    input [74:0]beep_bit,
    output beep
    );

	wire clk_02;
	counter #(2000)second1(clk,rst,clk_02);
    counter #(191)second2(clk_02,rst,final_clk);

    reg [5:0]cnt;

    assign beep = final_clk & beep_bit[cnt] & en;
    always @(posedge clk,posedge rst) begin
        if (en) begin
            if (rst) begin
                cnt <= 0;
            end
            else begin
                if (cnt!=6'b101000) begin
                    cnt = cnt + 1;
                end
                else begin
                    cnt <= 0;
                end
            end
        end
    end
	
	
endmodule