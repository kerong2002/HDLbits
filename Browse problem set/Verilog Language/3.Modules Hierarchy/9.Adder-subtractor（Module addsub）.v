//2022-06-04 陳科融
//Adder-subtractor（Module addsub）
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

wire [31:0] xor_b;
wire first_cout;
assign xor_b = b ^ {32{sub}};

add16 body1(.a(a[15:0]),.b(xor_b[15:0]),.cin(sub),.sum(sum[15:0]),.cout(first_cout));
add16 body2(.a(a[31:16]),.b(xor_b[31:16]),.cin(first_cout),.sum(sum[31:16]),.cout());

endmodule
