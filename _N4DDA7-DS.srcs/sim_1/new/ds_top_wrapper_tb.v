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
    reg echo_on;
    reg inc_freq;
    reg [1:0] wave_select;
    wire AUD_PWM;
    
    integer period = 10;
    
    ds_top_wrapper uut(
        .clk(clk),
        .rst(rst),
        .freq_select(freq_select),
        .echo_on(echo_on),
        .inc_freq(inc_freq),
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
        inc_freq = 1'b0;
        rst = 1'b1;
        echo_on = 1'b0;
        freq_select = 2'b00;
        wave_select = 2'b00;
        
        #(2 * period);
        
        rst = 1'b0;
        
        #((50000)/8 * period);
        echo_on = 1'b1;
        
        #((50000)/8 * period);
        echo_on = 1'b0;
        
        #((50000)/8 * period);
        wave_select = 2'b01;
        
        #((50000)/8 * period);
        freq_select = 2'b10;
        
        #(100 * period);
        inc_freq = 1'b1;
        
        #(2*period);
        inc_freq = 1'b0;
        
        #(200 * period);
        freq_select = 2'b00;
        
        #((50000)/8 * period);
        echo_on = 1'b1;
        
        #((50000)/8 * period);
        echo_on = 1'b0;
//###################################################//
        #((100000)/8 * period);
        wave_select = 2'b11;
        
        #((50000)/8 * period);
        freq_select = 2'b10;
        
        #(100 * period);
        inc_freq = 1'b1;
        
        #(2*period);
        inc_freq = 1'b0;
        
        #(10 * period);
        freq_select = 2'b00;
        
        #((50000)/8 * period);
        echo_on = 1'b1;
        
        #((50000)/8 * period);
        echo_on = 1'b0;
        
        #(100000 * period);
        
        $finish;
    end
endmodule
