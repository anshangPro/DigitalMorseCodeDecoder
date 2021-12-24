`timescale 1ns / 1ps

module de_translation(
    input clk,
    input rst,
    input flag,
    input [4:0] value,
    output reg [63:0] out
    );
    
    reg flag_lag1, flag_lag2;
    always @ (posedge clk) 
    begin
        flag_lag1 <= flag;
        flag_lag2 <= flag_lag1;
    end
      
    reg counting;
    reg [19:0] cnt;
    reg [7:0] val;
    always @ (posedge clk, posedge rst)
    begin
        if(rst) 
        begin
            out <= ~0;
            cnt <= 0;
        end
        else
        begin 
            if(flag_lag1 & ~flag_lag2)
            begin
                counting <= 1;
            end
            if(counting) 
            begin
                if(cnt == 1000000) 
                begin
                    counting <= 0;
                    cnt <= 0;
                    out <= {out[55:0], val};
                end 
                else cnt <= cnt + 1;
            end
        end
        case(value)
            5'ha: val <= 8'b1000_1000;
            5'hb: val <= 8'b1000_0011;
            5'hc: val <= 8'b1100_0110;
            5'hd: val <= 8'b1010_0001;
            5'he: val <= 8'b1000_0110;
            5'hf: val <= 8'b1000_1110;
            5'h10: val <= 8'b1100_0010;
            5'h11: val <= 8'b1000_1001;
            5'h12: val <= 8'b1111_0000;
            5'h13: val <= 8'b1111_0001;
            5'h14: val <= 8'b1000_1010;
            5'h15: val <= 8'b1100_0111;
            5'h16: val <= 8'b1100_1000;
            5'h17: val <= 8'b1010_1011;
            5'h18: val <= 8'b1010_0011;
            5'h19: val <= 8'b1000_1100;
            5'h1a: val <= 8'b1001_1000;
            5'h1b: val <= 8'b1100_1110;
            5'h1c: val <= 8'b1011_0110;
            5'h1d: val <= 8'b1000_0111;
            5'h1e: val <= 8'b1100_0001;
            5'h1f: val <= 8'b1110_0011;
            5'h20: val <= 8'b1000_0001;
            5'h21: val <= 8'b1001_1011;
            5'h22: val <= 8'b1001_0001;
            5'h23: val <= 8'b1010_0101;
            5'h1: val <= 8'b1111_1001;
            5'h2: val <= 8'b1010_0100;
            5'h3: val <= 8'b1011_0000;
            5'h4: val <= 8'b1001_1001;
            5'h5: val <= 8'b1001_0010;
            5'h6: val <= 8'b1000_0010;
            5'h7: val <= 8'b1111_1000;
            5'h8: val <= 8'b1000_0000;
            5'h9: val <= 8'b1001_0000;
            5'h0: val <= 8'b1100_0000;
            default: val <= 8'b1111_1111;
        endcase
    end
    
endmodule
