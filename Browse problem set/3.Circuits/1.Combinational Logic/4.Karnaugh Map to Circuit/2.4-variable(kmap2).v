//2022_11_1 kerong
//4-variable
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

assign out = (~d & ~a) | (~c & ~b) | (c & ~a & b) | (c & d & a);

endmodule