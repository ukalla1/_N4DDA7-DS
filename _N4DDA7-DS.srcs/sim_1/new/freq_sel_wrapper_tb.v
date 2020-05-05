`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////


module freq_sel_wrapper_tb(

    );
    
    reg clk;
    reg rst;
    reg [1:0] sel;
    wire [19:0] freq;
    
    integer period = 10;
    
    freq_sel_wrapper uut(
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .freq(freq)
    );
    
    
    initial begin
        clk = 1'b1;
    end
    
    always begin
        #(period/2) clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        sel = 2'b00;
        
        #(2*period);
        
        rst = 1'b0;
        
        #(2*period);
        
        sel = 2'b10;
        
        #(2*period);
        sel = 2'b11;
    end
    
endmodule
