//2022_11_10 kerong
//Combinational circuit 3
module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (b & d) | (b & c) | (a & d) | (a & c); // Fix me

endmodule
