`timescale 1ns / 1ps

module buzzer(
	input rst,
    input clk_lc,
	input clk_sc,
	input clk_ls,
	input clk_ss,
    output reg beep_lc,
	output reg beep_sc,
	output reg beep_ls,
	output reg beep_ss
    );
	always @ (posedge clk_lc , posedge rst)
	begin
		if(rst) begin
			beep_lc <= 1'b0;
		end
		else begin
		beep_lc <= beep_lc + 1;
		end
	
	end
	
	always @ (posedge clk_sc , posedge rst)
	begin
		if(rst) begin
			beep_sc <= 1'b0;
		end
		else begin
			beep_sc <= beep_sc + 1;
		end
	
	end

	always @ (posedge clk_ls , posedge rst)
	begin
		if(rst) begin
			beep_ls <= 1'b0;
		end
		else begin
			beep_ls <= beep_ls + 1;
		end
	
	end

	always @ (posedge clk_ss , posedge rst)
	begin
		if(rst) begin
			beep_ss <= 1'b0;
		end
		else begin
			beep_ss <= beep_ss + 1;
		end
	
	end
