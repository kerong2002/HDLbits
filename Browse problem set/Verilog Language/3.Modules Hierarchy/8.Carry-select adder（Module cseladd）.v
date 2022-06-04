//2022-06-04 陳科融
//Carry-select adder（Module cseladd）
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire trigger;
wire [15:0] buffer [1:0];
add16 body1(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]),.cout(trigger));
add16 body2(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(buffer[0]),.cout());
add16 body3(.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(buffer[1]),.cout());

assign sum[31:16]=(trigger==0)?buffer[0]:buffer[1];


endmodule
