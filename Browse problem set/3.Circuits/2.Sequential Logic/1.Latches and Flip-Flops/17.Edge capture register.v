//2022_11_2 kerong
//Edge capture register
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

reg [31:0] last;

always @(posedge clk) begin
    last <= in;
end


always @(posedge clk) begin
    if(reset)begin
        out <= 32'd0;
    end
    else begin
        out <= ~in & last | out;
    end
end

endmodule