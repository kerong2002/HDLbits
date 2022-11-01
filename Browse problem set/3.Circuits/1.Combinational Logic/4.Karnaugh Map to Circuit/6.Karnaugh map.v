//2022_11_1 kerong
//Karnaugh map
module top_module (
    input [4:1] x, 
    output f );

assign f = x[3] & ~x[1] | x[2] & x[4];

endmodule
