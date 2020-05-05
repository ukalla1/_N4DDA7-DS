`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module mux2_1(
    input [19:0] a, b, c,
    input [1:0] sel,
    output reg [19:0] y
);
    
    

    always @(*) begin
        case (sel)
            2'b00: begin
                y = a;
            end
            2'b01: begin
                y = b;
            end
            2'b10: begin
                y = c;
            end
            default: begin
                y = b;
            end
        endcase
    end

endmodule