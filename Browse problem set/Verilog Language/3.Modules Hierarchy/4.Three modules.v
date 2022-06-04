//2022-06-04 陳科融
//Three modules
module top_module ( input clk, input d, output q );

wire out[1:0];

my_dff body1(.clk(clk),
             .d(d),
             .q(out[0])
            );
my_dff body2(.clk(clk),
             .d(out[0]),
             .q(out[1])
            );
my_dff body3(.clk(clk),
             .d(out[1]),
             .q(q)
            );
endmodule
