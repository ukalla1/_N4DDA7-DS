`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module PWM_driver(
    input clk,
    input rst,
    input [7:0] pwm_level_in,
    output pwm_out
    );
    
    (*keep = "true"*) reg [7:0] counter, compare;
    (*keep = "true"*) reg pwm_out_int;
    
    assign pwm_out      = pwm_out_int;
    
    always @(posedge clk) begin
        if (rst) begin
            counter     <= 'd0;
            compare     <= 'd0;
            pwm_out_int <= 1'b0;
        end
        else begin
            if (counter == 'd0) begin
                counter <= counter + 1'b1;
                compare <= pwm_level_in;
            end
            else if(counter == 'd255) begin
                counter <= 'd0;
            end
            else begin
                counter <= counter + 1'b1;
                if (counter < compare) begin
                    pwm_out_int <= 1'b1;     
                end
                else begin
                    pwm_out_int <= 1'b0;
                end
            end
        end
    end
endmodule
