//2022_11_1 kerong
//DFF with asynchronous reset
module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);

always @(posedge clk , posedge areset)begin
    if(areset)begin
        q <= 8'd0;
    end
    else begin
        q <= d;
    end
end

endmodule
