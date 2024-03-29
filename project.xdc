#top
set_property PACKAGE_PIN Y18 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property PACKAGE_PIN P1 [get_ports {mode_sw}]
set_property IOSTANDARD LVCMOS33 [get_ports {mode_sw}]
set_property PACKAGE_PIN R1 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
set_property PACKAGE_PIN P5 [get_ports {backspace}]
set_property IOSTANDARD LVCMOS33 [get_ports {backspace}]
set_property PACKAGE_PIN P2 [get_ports {encoder_switch[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[8]}]

#buzzer switch
set_property PACKAGE_PIN V5 [get_ports {beep_sw1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep_sw1[0]}]
set_property PACKAGE_PIN R6 [get_ports {beep_sw1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep_sw1[1]}]
set_property PACKAGE_PIN T6 [get_ports {beep_sw2[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep_sw2[0]}]
set_property PACKAGE_PIN Y6 [get_ports {beep_sw2[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep_sw2[1]}]
set_property PACKAGE_PIN AA6 [get_ports {beep_sw3}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep_sw3}]
set_property PACKAGE_PIN A19 [get_ports {beep}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep}]

#switch for encoder
set_property PACKAGE_PIN W4 [get_ports {encoder_switch[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[0]}]
set_property PACKAGE_PIN R4 [get_ports {encoder_switch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[1]}]
set_property PACKAGE_PIN T4 [get_ports {encoder_switch[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[2]}]
set_property PACKAGE_PIN T5 [get_ports {encoder_switch[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[3]}]
set_property PACKAGE_PIN U5 [get_ports {encoder_switch[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[4]}]
set_property PACKAGE_PIN W6 [get_ports {encoder_switch[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[5]}]
set_property PACKAGE_PIN W5 [get_ports {encoder_switch[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[6]}]
set_property PACKAGE_PIN U6 [get_ports {encoder_switch[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {encoder_switch[7]}]


#seg_en 8bit
set_property PACKAGE_PIN C19 [get_ports {seg_en[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[0]}]
set_property PACKAGE_PIN E19 [get_ports {seg_en[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[1]}]
set_property PACKAGE_PIN D19 [get_ports {seg_en[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[2]}]
set_property PACKAGE_PIN F18 [get_ports {seg_en[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[3]}]
set_property PACKAGE_PIN E18 [get_ports {seg_en[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[4]}]
set_property PACKAGE_PIN B20 [get_ports {seg_en[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[5]}]
set_property PACKAGE_PIN A20 [get_ports {seg_en[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[6]}]
set_property PACKAGE_PIN A18 [get_ports {seg_en[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_en[7]}]

#seg_out  8bit
set_property PACKAGE_PIN F15 [get_ports {seg_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[0]}]
set_property PACKAGE_PIN F13 [get_ports {seg_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[1]}]
set_property PACKAGE_PIN F14 [get_ports {seg_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[2]}]
set_property PACKAGE_PIN F16 [get_ports {seg_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[3]}]
set_property PACKAGE_PIN E17 [get_ports {seg_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[4]}]
set_property PACKAGE_PIN C14 [get_ports {seg_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[5]}]
set_property PACKAGE_PIN C15 [get_ports {seg_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[6]}]
set_property PACKAGE_PIN E13 [get_ports {seg_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[7]}]

#leds
set_property PACKAGE_PIN K17 [get_ports {led_mode}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_mode}]
set_property PACKAGE_PIN J17 [get_ports {led_morse[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_morse[4]}]
set_property PACKAGE_PIN F21 [get_ports {led_morse[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_morse[3]}]
set_property PACKAGE_PIN G22 [get_ports {led_morse[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_morse[2]}]
set_property PACKAGE_PIN G21 [get_ports {led_morse[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_morse[1]}]
set_property PACKAGE_PIN D21 [get_ports {led_morse[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_morse[0]}]
set_property PACKAGE_PIN D22 [get_ports {led_cnt[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_cnt[2]}]
set_property PACKAGE_PIN E22 [get_ports {led_cnt[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_cnt[1]}]
set_property PACKAGE_PIN A21 [get_ports {led_cnt[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_cnt[0]}]

#keyboard
set_property PACKAGE_PIN M2 [get_ports {col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[3]}]
set_property PACKAGE_PIN K6 [get_ports {col[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[2]}]
set_property PACKAGE_PIN J6 [get_ports {col[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[1]}]
set_property PACKAGE_PIN L5 [get_ports {col[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[0]}]
set_property PACKAGE_PIN K4 [get_ports {row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}]
set_property PACKAGE_PIN J4 [get_ports {row[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}]
set_property PACKAGE_PIN L3 [get_ports {row[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}]
set_property PACKAGE_PIN K3 [get_ports {row[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}]