`timescale 1ns / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
//                                                                                
// Engineer: Uttej Kallakuri                                                      
//                                                                                
//////////////////////////////////////////////////////////////////////////////////

module tmp_sine(
    input clk,
    input rst,
    output [7:0] sine_out
    );
    
    (*keep = "true"*)  reg [23:0] alpha = 24'b0111_1111_1011_1001_1101_0110;
    (*keep = "true"*)  reg [23:0] beta  = 24'b1111_1011_1101_0000_0111_0000;
    
    (*keep = "true"*)  reg [47:0] mult;
    wire [47:0] prod;
    
    (*keep = "true"*)  reg [23:0] n1, n2, alpha_tmp;
    
    (*keep = "true"*)  reg [23:0] sine_int;
    
    wire load;
    
    assign load = ~rst;
    assign prod = alpha * n1;
    
    always @ (posedge clk) begin
        if (rst) begin
            mult        <= 'd0;
            n1          <= 'd0;
            n2          <= 'd0;
            sine_int    <= 'd0;
            alpha_tmp   <= 'd0;
        end
        else begin
            if (load) begin
                n2          <= beta;
                alpha_tmp   <= alpha;
            end
            else begin
                mult        <= prod;
                sine_int    <= mult[45:45-24] - n2;
                n2          <= n1;
                n1          <= sine_int;
            end
            
        end
    end
    
    assign sine_out = sine_int[23:16];
    
endmodule
