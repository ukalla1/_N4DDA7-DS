`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module mux21(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output reg [15:0] y
    );
    
    always @(*) begin
        if (sel) begin
            y = b;
        end
        else begin
            y = a;
        end
    end
endmodule
