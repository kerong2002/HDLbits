//2022-06-04 陳科融
//Modules（Module）
module top_module ( input a, input b, output out );
//by name
    mod_a body(.in1(a),
                .in2(b),
                .out(out));
endmodule
