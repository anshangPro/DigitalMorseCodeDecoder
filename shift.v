`timescale 1ns / 1ps

module shift(
    input clk, //backspace or flag
    input rst,
    input flag,
    input bs_button,
    input direction, //0 for flag , 1 for backspace
    input [3:0] in,
    output reg [63:0] out
);
    reg bs_lag1, bs_lag2;
    reg flag_lag1, flag_lag2;

    always @ (posedge clk) begin
        bs_lag1  <= bs_button;
        flag_lag1 <= flag;
        bs_lag2  <= bs_lag1;
        flag_lag2 <= flag_lag1;
    end

reg counting;
reg [19:0] cnt;
reg [7:0] val;
always @ (posedge clk, posedge rst) begin
    if(rst) begin
        out <= ~0;
        cnt <= 0;
    end
    else if(~direction) begin
        if(flag_lag1 & ~flag_lag2) counting <= 1;
        if(counting) begin
            if(cnt == 1000000) begin
                counting <= 0;
                cnt <= 0;
                out <= {out[55:0], val};
            end 
            else cnt <= cnt + 1;
        end
    end 
    else begin 
        if(bs_lag1 & ~bs_lag2)out <= {8'b1111_1111, out[63:8]};
        else out <= out;
    end
        case(in)
            4'h0: val=8'b1100_0000;  // 0
            4'h1: val=8'b1111_1001;  // 1
            4'h2: val=8'b1010_0100;  // 2
            4'h3: val=8'b1011_0000;  // 3
            4'h4: val=8'b1001_1001;  // 4
            4'h5: val=8'b1001_0010;  // 5
            4'h6: val=8'b1000_0010;  // 6
            4'h7: val=8'b1111_1000;  // 7
            4'h8: val=8'b1000_0000;  // 8
            4'h9: val=8'b1001_0000;  // 9
            4'hA: val=8'b1000_1000;  // A
            4'hB: val=8'b1000_0011;  // B
            4'hC: val=8'b1100_0110;  // C
            4'hD: val=8'b1010_0001;  // D
            4'hE: val=8'b1000_0110;  // E
            4'hF: val=8'b1000_1110;  // F
        endcase
end

endmodule