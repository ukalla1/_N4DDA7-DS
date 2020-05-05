`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module ds_top(
    input clk,
    input rst,
    input [1:0] freq_select,
    input [1:0] wave_select,
    output [7:0] wave_s
    );
    
    wire [19:0] freq_const;
    
    wire [7:0] wave_triangle, wave_square, wave_saw, wave_int_muxed;
    
    wire [7:0] wave_sine;
    
    reg [7:0] wave_internal;
    
    reg [19:0] freq_const_r;
    
    assign wave_s = wave_internal;
    
    freq_sel_wrapper fsw(
        .clk(clk),
        .rst(rst),
        .sel(freq_select),
        .freq(freq_const)
    );
    
    tri_wave tw(
        .clk(clk),
        .rst(rst),
        .cnt_val(freq_const_r),
        .tri_wave_out(wave_triangle)
    );
    
    saw_wave sw(
        .clk(clk),
        .rst(rst),
        .cnt_val(freq_const_r),
        .saw_wave_out(wave_saw)
    );
    
    sqw_wave sqw(
        .clk(clk),
        .rst(rst),
        .cnt_val(freq_const_r),
        .sqw_wave_out(wave_square)
    );
    
    tmp_sine tsine(
        .clk(clk),
        .rst(rst),
        .sine_out(wave_sine)
    );
    
    mux m2(
        .a(wave_triangle),
        .b(wave_saw),
        .c(wave_square),
        .d(wave_sine),
        .sel(wave_select),
        .y(wave_int_muxed)
    );
    
    always @(posedge clk) begin
        if (rst) begin
            wave_internal       <= 'd0;
            freq_const_r        <= 'd0;
        end
        else begin
            wave_internal       <= wave_int_muxed;
            freq_const_r        <= freq_const;
        end
    end
    
endmodule
