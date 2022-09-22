//2022/09/22 陳科融
//NOR
module top_module (
    input in1,
    input in2,
    output out);

assign out = ~(in1 | in2);

endmodule
