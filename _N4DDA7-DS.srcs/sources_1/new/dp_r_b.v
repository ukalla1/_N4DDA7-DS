`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////


module dp_r_b(
    input clk,
    input rst,
    input en,
    input [7:0] data_i,
    input [13:0] rd_ptr, wr_ptr,
    output [7:0] data_o
    );
    
    (*keep = "true"*) reg [7:0] i_in, i_out;
    
    (* ram_style = "block" *) reg [7:0] mem [0:16384-1];
    
    assign data_o = i_out;
    
    always @(posedge clk) begin
        if(rst) begin
            i_in        <= 'd0;
            i_out       <= 'd0;
        end
        else begin
            if(en) begin
                i_in        <= data_i;
                mem[wr_ptr] <= i_in >>> (8 + 1);
                i_out       <= (mem[rd_ptr] << 8);
            end
        end
    end
    
endmodule
