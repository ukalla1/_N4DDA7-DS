`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module freq_cntrl(
    input clk,
    input rst,
    input [1:0] freq_cntrl,
    input togl,
    output [19:0] freq
    );
    
    reg [19:0] freq_int, freq_int_pipe;
    
    localparam init_freq = 32'b0000_0000_0000_0111_1010_0001_0010_0000;
    
    assign freq             = freq_int_pipe;
    
    always @(posedge clk) begin
        if(rst) begin
            freq_int        <= init_freq[19:0];
            freq_int_pipe   <= freq_int;
        end
        else begin
            if (togl) begin
                if (freq_cntrl[1]) begin
                    freq_int    <= freq_int + 'd100;
                end
                else if (freq_cntrl[0]) begin
                    freq_int    <= freq_int - 'd100;
                end
            end
            else begin
                 if (freq_cntrl[1]) begin
                    freq_int    <= freq_int + 'd10;
                end
                else if (freq_cntrl[0]) begin
                    freq_int    <= freq_int - 'd10;
                end
            end
            freq_int_pipe       <= freq_int;
        end
    end
endmodule
