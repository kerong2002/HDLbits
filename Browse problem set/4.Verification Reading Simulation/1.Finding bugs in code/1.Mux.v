//2022_11_10 kerong
//Mux
module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output out  );

    assign out = sel ? a : b;

endmodule
