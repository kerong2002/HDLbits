//2022_11_2 kerong
//Rule 110
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 

always @(posedge clk)begin
    if(load)begin
        q <= data;
    end
    else begin
        q <= ~q & {q[510:0],1'b0} |
        q & ~ {1'b0,q[511:1]}|
        ~ {1'b0,q[511:1]} & {q[510:0],1'b0}|
        q & ~{q[510:0],1'b0};
    end
end

endmodule
