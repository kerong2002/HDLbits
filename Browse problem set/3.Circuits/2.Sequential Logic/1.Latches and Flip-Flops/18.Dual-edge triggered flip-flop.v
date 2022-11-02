//2022_11_2 kerong
//Dual-edge triggered flip-flop
module top_module (
    input clk,
    input d,
    output q
);

reg neg_d;
reg pos_d;

always @(posedge clk)begin
    pos_d <= d;
end

always @(negedge clk) begin
    neg_d <= d;
end


assign q = clk ? pos_d : neg_d;

endmodule
