`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module rc_tp_dac(
    input clk,
    input rst,
    input [7:0] pwm_in,
    output pwm_out
    );
    
    localparam max_cnt_delayed = 31'd2147;
    
    (*keep = "true"*) reg [15:0] cnt_delayed = 'd0;
    (*keep = "true"*) reg [15:0] cnt;
    (*keep = "true"*) reg pwm_out_int;
    
    assign pwm_out = pwm_out_int;
    
    always @(posedge clk) begin
        if(rst) begin
            cnt_delayed     <= 'd0;
            cnt             <= max_cnt_delayed;
            pwm_out_int     <= 1'b0;
        end
        else begin
            if (cnt > 0) begin
                cnt         <= cnt -1'b1;
            end
            
            if (cnt_delayed >= max_cnt_delayed) begin
                cnt         <= pwm_in * {4'b0000,4'b1000};
                cnt_delayed <= 'd0;
            end
            
            if (cnt == 'd0) begin
                pwm_out_int <= 1'b0;
            end
            else begin
                pwm_out_int <= 1'b1;
            end
            
            cnt_delayed     <= cnt_delayed + 1'b1;
        end
    end
    
endmodule
