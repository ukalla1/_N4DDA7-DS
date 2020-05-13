`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module filt_fir_lp(
    input clk,
    input rst,
    input [7:0] in,
    output [7:0] out
    );
    
    localparam  coef_w = 8, tap = 11, guard = 0;
    
    reg [7:0] mem_rom [0:10];
    reg [7:0] sr [0:10];
    reg [14:0] mult [0:10];
    reg [14:0] adder [0:10];
    
    always @(posedge clk) begin
        if(rst) begin
            mem_rom[0]  <=  'hf1;
            mem_rom[1]  <=  'hf3;
            mem_rom[2]  <=  'h07;
            mem_rom[3]  <=  'h26;
            mem_rom[4]  <=  'h42;
            mem_rom[5]  <=  'h4e;
            mem_rom[6]  <=  'h42;
            mem_rom[7]  <=  'h26;
            mem_rom[8]  <=  'h07;
            mem_rom[9]  <=  'hf3;
            mem_rom[10]  <=  'hf1;
        end
        else begin
        
        end
    end
endmodule
