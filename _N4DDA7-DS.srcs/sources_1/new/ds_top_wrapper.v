`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module ds_top_wrapper(
    input clk,
    input rst,
    input [1:0] freq_select,
    input [1:0] wave_select,
    output AUD_PWM
    );
    
    wire [7:0] wave_f_gen;
    
    ds_top dig_wave_gen(
        .clk(clk),
        .rst(rst),
        .freq_select(freq_select),
        .wave_select(wave_select),
        .wave_s(wave_f_gen)
    );
    
//    PWM_audio gen_aud(
//        .clk(clk),
//        .rst(rst),
//        .wave_in(wave_f_gen),
//        .pwm_out(AUD_PWM)
//    );

    rc_tp_dac tp_dac(
        .clk(clk),
        .rst(rst),
        .pwm_in(wave_f_gen),
        .pwm_out(AUD_PWM)
    );
endmodule
