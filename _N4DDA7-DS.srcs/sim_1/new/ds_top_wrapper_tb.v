`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 06:28:30 PM
// Design Name: 
// Module Name: ds_top_wrapper_tb
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


module ds_top_wrapper_tb(

    );
    
    reg clk;
    reg rst;
    reg [1:0] freq_select;
    reg [1:0] wave_select;
    wire AUD_PWM;
    
    integer period = 10;
    
    ds_top_wrapper uut(
        .clk(clk),
        .rst(rst),
        .freq_select(freq_select),
        .wave_select(wave_select),
        .AUD_PWM(AUD_PWM)
    );
    
    initial begin
        clk = 1'b1;
    end
    
    always begin
        #(period/2) clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        freq_select = 2'b01;
        wave_select = 2'b00;
        
        #(2 * period);
        
        rst = 1'b0;
        
        #(100000 * period);
        
        $finish;
    end
endmodule
