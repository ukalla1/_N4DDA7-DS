`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module freq_sel_wrapper(
    input               clk,
    input               rst,
    input [1:0]         sel,
    output [19:0]       freq
);

    wire [19:0] freq2h;
    wire [19:0] freq2kh;
    wire [19:0] freq4kh;

    freq_sel f1(
        .clk            (clk),
        .rst            (rst),
        .freq2h         (freq2h),
        .freq2kh        (freq2kh),
        .freq4kh        (freq4kh)
    );

    mux2_1 m1(
        .a              (freq2h),
        .b              (freq2kh),
        .c              (freq4kh),
        .sel            (sel),
        .y              (freq)
    );

endmodule