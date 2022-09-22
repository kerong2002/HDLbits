//2022-06-04 陳科融
//Adder 1（Module add）
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire [15:0] total [1:0];
wire add16_cout;

add16 body1(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(total[0]),.cout(add16_cout));
add16 body2(.a(a[31:16]),.b(b[31:16]),.cin(add16_cout),.sum(total[1]),.cout());

assign sum={total[1],total[0]};

endmodule
