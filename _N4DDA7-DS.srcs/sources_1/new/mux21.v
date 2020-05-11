`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module mux21(
    input [7:0] a,
    input [7:0] b,
    input sel,
    output reg [7:0] y
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
