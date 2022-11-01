//2022_11_1 kerong
//Mux and DFF
module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

always @(posedge clk)begin
    if(L)begin
        Q <= r_in;
    end
    else begin
        Q <= q_in;
    end
end

endmodule
