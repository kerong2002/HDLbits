//2022_11_1 kerong
//Full adder

module top_module( 
    input a, b, cin,
    output cout, sum );

assign {cout , sum} = a + b + cin;

endmodule
