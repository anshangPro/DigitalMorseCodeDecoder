`timescale 1ns / 1ps

module buzzer(
    input  clk,
    input  rst,
    output reg beep
    );
	
	reg [19:0] cnt; 
	
	//计数模块，计数达到1000 000次，计数器清零
	always @ (posedge clk or negedge rst)
	begin
		if(~rst)
			cnt <= 20'b0;
		else if(cnt < 20'd999_999)
			cnt <= cnt + 1'b1;
		else
			cnt <= 20'b0;
	end
 
    //占空比为50%，高电平有效
	always @ (posedge clk or negedge rst)
	begin
		if(~rst)
			beep <= 1'b0;
		else if(cnt < 500_000)
			beep <= 1'b1;
		else 
			beep <= 1'b0;
	
	end
	
endmodule