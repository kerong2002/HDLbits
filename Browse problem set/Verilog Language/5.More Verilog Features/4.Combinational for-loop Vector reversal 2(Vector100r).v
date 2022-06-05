//2022-06-05 陳科融
//Combinational for-loop: Vector reversal 2(Vector100r)
module top_module( 
    input [99:0] in,
    output [99:0] out
);

generate
    genvar i;
    for(i=0;i<100;i=i+1)begin:rev
        assign out[i] = in[99-i];
    end     
endgenerate

endmodule
