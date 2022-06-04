//2022-02-22 陳科融
//NOR gate
module top_module(
            input a,
            input b,
            output out);

assign      out=~(a|b);

endmodule 