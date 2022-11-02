//2022_11_2 kerong
//Detect both edge
module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

reg [7:0] last;

always @(posedge clk) begin
    last <= in;
end

always @(posedge clk) begin
    anyedge <= last ^ in;
end

endmodule
