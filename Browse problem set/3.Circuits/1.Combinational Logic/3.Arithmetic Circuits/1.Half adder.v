//2022_11_1 kerong
//Half adder
module top_module( 
    input a, b,
    output cout, sum );

assign {cout , sum} = a + b;

endmodule
