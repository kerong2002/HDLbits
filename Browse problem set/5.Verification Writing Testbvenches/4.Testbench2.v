//2023_8_3 kerong
//Testbench2
`timescale 1ps/1ps
`define cycle 10
module top_module();
	reg clk 	= 1'b0;
	reg in 		= 1'b0;
	reg [2:0] s;
	wire out;

	q7 u_q7(
		    .clk(clk),
		    .in(in),
		    .s(s),
		    .out(out)
			);

	always #(`cycle / 2) clk = ~clk;

	initial begin
			s = 3'd2;
		#10 s = 3'd6;
		#10 s = 3'd2;
		#10 s = 3'd7;
		#10 s = 3'd0;
	end

	initial begin
		#20 in = 1'b1;
		#10 in = 1'b0;
		#10 in = 1'b1;
		#30 in = 1'b0;
	end
	
endmodule