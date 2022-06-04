
//Connecting ports by position（Module pos）
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
//by position
mod_a body(out1,
           out2,
           a,
           b,
           c,
           d
           );

endmodule