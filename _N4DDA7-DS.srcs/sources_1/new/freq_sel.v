`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module freq_sel(
    input clk,
    input rst,
    output [19:0] freq2h,
    output [19:0] freq2kh,
    output [19:0] freq4kh
);
    
    (*keep = "true"*) reg [19:0] freq2h_r;
    (*keep = "true"*) reg [19:0] freq2kh_r;
    (*keep = "true"*) reg [19:0] freq4kh_r;

    assign freq2h = freq2h_r;
    assign freq2kh = freq2kh_r;
    assign freq4kh = freq4kh_r;

    always @(posedge clk) begin
        if (rst) begin
            freq2h_r          <= 'd0;
            freq2kh_r         <= 'd0;
            freq4kh_r         <= 'd0;
        end
        else begin
            freq2h_r          <=  20'b0111_1010_0001_0010_0000;    //     (200Hz signal)
            freq2kh_r         <=  20'b0000_1100_0011_0101_0000;    //     (2kHz signal)
            freq4kh_r         <=  20'b0000_0110_0001_1010_1000;    //     (4kHz signal)
        end
    end

endmodule