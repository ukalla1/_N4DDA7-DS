`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module echo_m(
    input clk,
    input rst,
    input echo_on,
    input [7:0] aud_i,
    (*keep = "true"*) output reg [7:0] echo_o
    );
    
    (*keep = "true"*) reg echo_ctrl_i;
    
    (*keep = "true"*) reg [13:0] rd_ptr, wr_ptr;
    
    wire [7:0] i_out;
    
    dp_r_b mem_i(
        .clk(clk),
        .rst(rst),
        .en(echo_ctrl_i),
        .data_i(aud_i),
        .rd_ptr(rd_ptr),
        .wr_ptr(wr_ptr),
        .data_o(i_out)
    );
    
    
    always @(posedge clk) begin
        if(rst) begin
            rd_ptr      <= 'd0;
            wr_ptr      <= 'd0;
            echo_ctrl_i <= 1'b0;
            echo_o      <= 'd0;
        end
        else begin
            if(rd_ptr != wr_ptr) begin
                rd_ptr  <= wr_ptr;
            end
            else begin
                echo_ctrl_i <= echo_on;
                if(echo_ctrl_i) begin
                    wr_ptr      <= ((wr_ptr + 1) % 16384);
                    rd_ptr      <= ((wr_ptr + 1) % 16384);
                    echo_o      <= (aud_i + i_out);
                end
            end
        end
    end
    
endmodule
