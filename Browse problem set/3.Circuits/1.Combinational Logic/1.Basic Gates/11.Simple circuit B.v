//2022/09/22 陳科融
//Simple circuit B
module top_module ( input x, input y, output z );

assign z = x ~^ y;

endmodule
