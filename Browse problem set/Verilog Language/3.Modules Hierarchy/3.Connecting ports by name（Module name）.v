//2022-06-04 陳科融
//Connecting ports by name（Module name）
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
//by name
mod_a body(.out1(out1),
           .out2(out2),
           .in1(a),
           .in2(b),
           .in3(c),
           .in4(d)
            );
endmodule