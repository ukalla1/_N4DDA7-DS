`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 03:56:02 PM
// Design Name: 
// Module Name: gen_p_rom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_p_rom(
    input clk,
    input rst,
    input [3:0] addrs,
    output reg [7:0] coef
    );
    
    reg [7:0] mem_rom [0:10];
    
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
            coef        <= 'h0;
        end
        else begin
            coef        <= mem_rom[addrs];
        end
    end
endmodule
