//2022_10_31 kerong
//2-to-1 multiplexer
module top_module( 
    input a, b, sel,
    output out ); 

assign out = sel ? b : a;

endmodule
