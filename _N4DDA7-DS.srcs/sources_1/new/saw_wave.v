`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module saw_wave(
    input clk,
    input rst,
    input [19:0] cnt_val,
    output [15:0] saw_wave_out
);

    (*keep = "true"*) reg [19:0] counter;
    (*keep = "true"*) reg [15:0] int_counter;
//    (*keep = "true"*) reg [19:0] cnt_val_int;
    
    integer i;

    assign saw_wave_out = int_counter;
    
    always @(posedge clk) begin
        if (rst) begin
            counter     <= 'd0;
            int_counter <= 'd0;
        end
        else begin
            if (counter <= cnt_val/'d255) begin
                counter <= counter + 1'b1;
            end
            else begin
                counter <= 'd0;
                if (int_counter < 'd65535) begin
                    int_counter <= int_counter + 1'b1;
                end
                else begin
                    int_counter <= 'd0;
                end
            end
        end
    end
    
//    always @(posedge clk) begin
//        if(rst) begin
//            cnt_val_int     <= cnt_val;
//        end
//        else begin
//            for (i=0; i<8; i= i+1) begin
//                cnt_val_int       <= cnt_val_int >> 1;
//            end
//        end
//    end

endmodule