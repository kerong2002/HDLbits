//2022_10_31 kerong
//2-to-1 bus multiplexer
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

assign out = sel ? b : a;

endmodule
