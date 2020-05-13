`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module sqw_wave(
    input clk,
    input rst,
    input [19:0] cnt_val,
    output [15:0] sqw_wave_out
);

    (*keep = "true"*) reg [19:0] counter;
    (*keep = "true"*) reg flag;
    wire clk_i;
    (*keep = "true"*) reg [15:0] sqw_wave_out_r;
//    (*keep = "true"*) reg [19:0] cnt_val_int;
    
    integer i;
    
    assign sqw_wave_out = sqw_wave_out_r;
    assign clk_i = flag;
    
    always @(posedge clk) begin
        if (rst) begin
            counter     <= 'd0;
            flag        <= 1'b0;
        end
        else begin
            if (counter < cnt_val/'d512) begin
                counter <= counter + 1'b1;
                flag    <= flag;
            end
            else begin
                counter <= 'd0;
                flag    <= ~flag;
            end
        end
    end
    
    always @(posedge clk_i or posedge rst) begin
        if (rst) begin
//            cnt_val_int       <= cnt_val;
            sqw_wave_out_r    <= 'd0;
        end
        else begin
//            for (i=0; i<5; i= i+1) begin
//                cnt_val_int       <= cnt_val_int >> 1;
//            end
            sqw_wave_out_r    <= ~sqw_wave_out_r;
        end
    end

endmodule