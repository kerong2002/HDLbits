//2022_11_1 kerong
//DFF+gate
module top_module (
    input clk,
    input in, 
    output out);

always @(posedge clk)begin
    out <= in ^ out;
end

endmodule
