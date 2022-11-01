//2022_10_30 kerong
//256-to-1 4bit multiplexer
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

//assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};
assign out = in[sel*4+:4];
//assign out = in[sel*4 + 3 -:4];


endmodule
