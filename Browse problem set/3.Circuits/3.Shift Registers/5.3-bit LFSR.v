//2022_11_1 kerong
//3-bit LFSR
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output reg[2:0] LEDR);  // Q

always @(posedge KEY[0])begin
    if(KEY[1])begin
        LEDR <= SW;
    end
    else begin
        LEDR <= {LEDR[2] ^ LEDR[1],LEDR[0],LEDR[2]};
    end
end

endmodule
