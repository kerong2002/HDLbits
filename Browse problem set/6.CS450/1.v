//2023_8_4 kerong
//1
module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);

	reg [9:0] timer;
	always @(posedge clk) begin
		if(load)begin
			timer <= data;
		end
		else begin
			timer <= (!timer) ? timer : timer - 10'd1;
		end
	end

	assign tc = !timer;
	
endmodule
