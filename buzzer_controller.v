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

	

    // //long_code
    // always @(temp1) begin
	// 	case(temp1)
	// 	2'b01:time_lc=5'b11111;//1.0
	// 	2'b10:time_lc=8'b1111_1111;//1.6
	// 	2'b11:time_lc=10'b11_1111_1111;//2.0
	// 	endcase
	// end

    // //short_code
	// always @(temp2) begin
	// 	case(temp2)
	// 	2'b01:time_sc=1'b1;//0.2
	// 	2'b10:time_sc=3'b111;//0.6
	// 	2'b11:time_sc=4'b1111;//0.8
	// 	endcase
	// end

    // //short_space
	// always @(temp3) begin
	// 	case(temp3)
	// 	1'b0:time_ss=3'b0;//0.6
	// 	1'b1:time_ss=5'b0;//1.0
	// 	endcase
	// end
endmodule