//2023_8_3 kerong
//Clock

`timescale 1ps / 1ps
module top_module ( );
	reg clk;

	dut u_dut(.clk(clk));

	initial begin
		clk = 1'b0;
		forever
			#5 clk = ~clk;
	end

	/*
	initial begin
		clk = 1'b0;
	end

	always begin
		#5	clk = ~clk;
	end
	*/
endmodule
