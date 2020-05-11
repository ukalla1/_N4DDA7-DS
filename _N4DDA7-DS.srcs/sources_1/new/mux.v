`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module mux(
    input [7:0] a,b,c,
    input [1:0] sel,
    output reg [7:0] y
    );
    
    always @(*) begin
        case(sel)
            2'b00: begin
                y = 'd0;
            end
            2'b01: begin
                y = a;
            end
            2'b10: begin
                y = b;
            end
            2'b11: begin
                y = c;
            end
            default: begin
                y = a;
            end
        endcase
    end
endmodule
