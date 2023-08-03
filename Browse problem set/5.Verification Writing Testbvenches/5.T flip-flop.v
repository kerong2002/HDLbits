//2023_8_3 kerong
//T flip-flop
`timescale 1ps/1ps
`define cycle 10
module top_module ();
	reg clk = 0;
	reg reset = 0;
	reg t;
	wire q;

	tff u_tff(
		    .clk(clk),
		    .reset(reset),
		    .t(t),
		    .q(q)
			);

	always #(`cycle / 2) clk = ~clk;

	initial begin
        		reset = 1'b0;
        #3  	reset = 1'b1;
        #10 	reset = 1'b0;   
    end

	always@(posedge clk)begin
        if(reset)begin
            t <= 1'b0;
        end
        else begin
            t <= 1'b1;
        end
    end


endmodule