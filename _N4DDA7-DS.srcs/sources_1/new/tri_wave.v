`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module tri_wave(
    input clk,
    input rst,
    input [19:0] cnt_val,
    output [7:0] tri_wave_out
);

    (*keep = "true"*) reg [19:0] counter;
    (*keep = "true"*) reg [7:0] int_counter;
    (*keep = "true"*) reg switch;
//    (*keep = "true"*) reg [19:0] cnt_val_int;
    
    integer i;

    assign tri_wave_out = int_counter;
    
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
                if (switch == 1'b0) begin
                    int_counter <= int_counter + 1'b1;
                end
                else begin
                    int_counter <= int_counter - 1'b1;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if (rst) begin
            switch <= 1'b0;
//            cnt_val_int <= cnt_val;
        end
        else begin
            if (int_counter == 'd255) begin
                switch <= 1'b1;
            end
            else if (int_counter == 'd0) begin
                switch <= 1'b0;
            end
            else begin
                switch <= switch;
            end
//            for (i=0; i<8; i= i+1) begin
//                cnt_val_int       <= cnt_val_int >> 1;
//            end
        end
        
    end

endmodule