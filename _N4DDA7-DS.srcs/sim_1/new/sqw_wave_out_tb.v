`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 02:24:56 PM
// Design Name: 
// Module Name: sqw_wave_out_tb
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


module sqw_wave_out_tb(

    );
    
    reg clk;
    reg rst;
    reg [19:0] cnt_val = 20'b0000_0110_0001_1010_1000;
    wire [7:0] sqw_wave_out;
    
    integer period = 10;
    
    
    sqw_wave uut(
        .clk(clk),
        .rst(rst),
        .cnt_val(cnt_val),
        .sqw_wave_out(sqw_wave_out)
    );
    
    initial begin
        clk = 1'b1;
    end
    
    always begin
        #(period/2) clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        
        #(2*period);
        rst = 1'b0;
        
        #(1000000*period);
        
        $finish;
        
    end
    
endmodule
