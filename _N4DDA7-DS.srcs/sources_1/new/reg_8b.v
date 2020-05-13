`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module reg_8b(
    input clk,
    input rst,
    input [7:0] d,
    output [7:0] out
);

    reg [7:0] flops;
    
    assign out          = flops;
    
    always @(posedge clk) begin
        if(rst) begin
            flops       <= 'd0;
        end
        else begin
            flops       <= d;
        end
    end

endmodule