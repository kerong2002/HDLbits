//2023_8_3 kerong
//AND gate
`timescale 1ps / 1ps
module top_module();
	reg [1:0] in;
	wire out;

	andgate u_andgate(
				    .in(in),
				    .out(out)
					 );

	initial begin
			in = 2'b00;
		#10 in = 2'b01;
		#10 in = 2'b10;
		#10 in = 2'b11;
	end

endmodule