//2022-06-04 陳科融
//Adder 2（Module fadd）
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

wire add16_count;

add16 body1(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]),.cout(add16_count));
add16 body2(.a(a[31:16]),.b(b[31:16]),.cin(add16_count),.sum(sum[31:16]),.cout());

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

assign {cout,sum}= a + b + cin;


endmodule
