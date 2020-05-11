`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module ds_top_wrapper(
    input wire clk,
    input wire rst,
    input wire echo_on,
    input wire inc_freq,
    input wire [1:0] freq_select,
    input wire [1:0] wave_select,
    output wire AUD_PWM
    );
    
    wire [7:0] wave_f_gen;
    wire [7:0] echo_o;
    wire [7:0] muxed_wave;
    
    ds_top dig_wave_gen(
        .clk(clk),
        .rst(rst),
        .freq_select(freq_select),
        .inc_freq(inc_freq),
        .wave_select(wave_select),
        .wave_s(wave_f_gen)
    );
    
    echo_m m_ech(
        .clk(clk),
        .rst(rst),
        .echo_on(echo_on),
        .aud_i(wave_f_gen),
        .echo_o(echo_o)
    );
    
    mux21 m3(
        .a(wave_f_gen),
        .b(echo_o),
        .sel(echo_on),
        .y(muxed_wave)
    );
    
//    mux m3(
//        .a(wave_f_gen),
//        .b(echo_o),
//        .c('d0),
////        .d('d0),
//        .sel({1'b0,echo_on}),
//        .y(muxed_wave)
//    );
    
//    PWM_audio gen_aud(
//        .clk(clk),
//        .rst(rst),
//        .wave_in(wave_f_gen),
//        .pwm_out(AUD_PWM)
//    );

    rc_tp_dac tp_dac(
        .clk(clk),
        .rst(rst),
        .pwm_in(muxed_wave),
        .pwm_out(AUD_PWM)
    );
endmodule
