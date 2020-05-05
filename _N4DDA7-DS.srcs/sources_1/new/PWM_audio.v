`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module PWM_audio(
    input clk,
    input rst,
    input [7:0] wave_in,
    output pwm_out
    );
    
    wire pwm_out_int;
    
    PWM_driver PWMD(
        .clk(clk),
        .rst(rst),
        .pwm_level_in(wave_in),
        .pwm_out(pwm_out_int)
    );
    
    assign pwm_out = (pwm_out_int == 1'b0) ? 1'b0: 1'b1;
    
endmodule
