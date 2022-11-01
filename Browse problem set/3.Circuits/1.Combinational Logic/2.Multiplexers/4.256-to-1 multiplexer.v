//2022_10_30 kerong
//256-to-1 multiplexer
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

assign out = in[sel];

endmodule
