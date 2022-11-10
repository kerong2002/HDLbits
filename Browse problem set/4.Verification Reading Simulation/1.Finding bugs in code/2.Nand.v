//2022_11_10 kerong
//Nand
module top_module (input a, input b, input c, output out);//

    wire take;
    andgate inst1 (.a(a), .b(b), .c(c), .d(1'b1), .e(1'b1), .out(take));
    assign out = ~take;
endmodule
