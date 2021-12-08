`timescale 1ns / 1ps

module mode_switch(
    input sw,
    output reg decoder_en,
    output reg encoder_en
);
    
    assign decoder_en = sw;
    assign encoder_en = ~sw;

decoder();
encoder();
endmodule
