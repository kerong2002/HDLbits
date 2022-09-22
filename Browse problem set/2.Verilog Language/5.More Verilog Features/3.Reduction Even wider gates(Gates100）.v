//2022-06-05 陳科融
//Reduction: Even wider gates(Gates100）
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);

assign out_and = & in;
assign out_or = | in;
assign out_xor = ^ in;

endmodule
