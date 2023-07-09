//2022_11_10 kerong
//Combinational circuit 2
module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = ~^{a,b,c,d}; // Fix me

endmodule
