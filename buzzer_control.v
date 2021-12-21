`timescale 1ns / 1ps

module buzzer_control(
	input  switch1,
	input  switch2,
	input  switch3,
	input  switch4,
	input  rst,
	output reg clk_lc,
	output reg clk_sc,
	output reg clk_ls,
	output reg clk_ss
    );

	reg [1:0] temp1;
	always @(posedge switch1 or posedge rst) begin
		if (rst) begin
			temp1 <= 2'b01;
		end
		else begin
		if (temp1==2'b11) begin
			temp1 <= 2'b01;
		end
		else begin
			temp1 <= temp1 + 1;
		end
		end
	end

    reg [1:0] temp2;
	always @(posedge switch2 or posedge rst) begin
		if (rst) begin
			temp2 <= 2'b01;
		end
		else begin
		if (temp2==2'b11) begin
			temp2 <= 2'b01;
		end
		else begin
			temp2 <= temp2 + 1;
		end
		end
	end

	reg temp3;
	always @(posedge switch3 or posedge rst) begin
		if (rst) begin
			temp3 <= 1'b0;
		end
		else begin
		if (temp3==1'b1) begin
			temp3 <= 1'b0;
		end
		else begin
			temp3 <= temp3 + 1;
		end
		end
	end


	reg temp4;
	always @(posedge switch4 or posedge rst) begin
		if (rst) begin
			temp4 <= 1'b0;
		end
		else begin
		if (temp4==1'b1) begin
			temp4 <= 1'b0;
		end
		else begin
			temp4 <= temp4 + 1;
		end
		end
	end

	wire clk_02,clk_05,clk_08,clk_10,clk_15,clk_20;
	counter #(1000_0000) second1(clk,rst,clk_02);//0.2
	counter #(2500_0000) second2(clk,rst,clk_05);//0.5
	counter #(4000_0000) second3(clk,rst,clk_08);//0.8
	counter #(5000_0000) second4(clk,rst,clk_10);//1.0
	counter #(7500_0000) second5(clk,rst,clk_15);//1.5
	counter #(1_0000_0000) second6(clk,rst,clk_20);//2.0

	always @(temp1) begin
		case(temp1)
		2'b01:clk_lc=clk_10;
		2'b10:clk_lc=clk_15;
		2'b11:clk_lc=clk_20;
		endcase
	end

	always @(temp2) begin
		case(temp2)
		2'b01:clk_sc=clk_02;
		2'b10:clk_sc=clk_05;
		2'b11:clk_sc=clk_08;
		endcase
	end

	always @(temp3) begin
		case(temp3)
		1'b0:clk_ls=clk_05;
		1'b1:clk_ls=clk_10;
		endcase
	end

	always @(temp1) begin
		case(temp4)
		1'b0:clk_ss=clk_10;
		1'b1:clk_ss=clk_20;
		endcase
	end
endmodule