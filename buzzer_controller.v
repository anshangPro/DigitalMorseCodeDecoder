`timescale 1ns / 1ps

module buzzer_controller(
    input  clk,
	input  switch1,
	input  switch2,
	input  switch3,
	input  rst,
	output reg [1:0]temp1,
	output reg [1:0]temp2,
	output reg temp3
    );

	always @(posedge clk or posedge rst) begin
        if (rst) begin
			temp1 <= 2'b01;
		end
		else if(switch1)begin
		if (temp1==2'b11) begin
			temp1 <= 2'b01;
		end
		else begin
			temp1 <= temp1 + 1;
		end
        end
    end	


	always @(posedge clk or posedge rst) begin
        if (rst) begin
			temp2 <= 2'b01;
		end
		else if(switch2)begin
		if (temp2==2'b11) begin
			temp2 <= 2'b01;
		end
		else begin
			temp2 <= temp2 + 1;
		end
		end
    end	

	always @(posedge clk or posedge rst) begin
        if (rst) begin
			temp3 <= 1'b0;
		end
		else if(switch3) begin
		if (temp3==1'b1) begin
			temp3 <= 1'b0;
		end
		else begin
			temp3 <= temp3 + 1;
		end
		end
    end
endmodule