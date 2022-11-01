//2022_11_1 kerong
//Detect an edge
module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
reg [7:0] last; 

always @(posedge clk) begin
    last <= in;
end

always @(posedge clk) begin
    pedge <= ~last & in;
end


endmodule
