//2022-06-04 陳科融
//Four-input gates（Gates4）
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

assign out_and = &in;
assign out_or = |in;
assign out_xor = ^in;

endmodule
