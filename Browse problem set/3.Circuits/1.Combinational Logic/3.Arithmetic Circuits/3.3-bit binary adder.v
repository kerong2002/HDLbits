//2022_11_1 kerong 
//3-bit binary adder
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    adder a1(a[0],b[0],cout[0],sum[0],cin);
    generate
        genvar x;
        for(x=1;x<=2;x=x+1)begin:add_generate
            adder add_name(a[x],b[x],cout[x],sum[x],cout[x-1]);
        end
    endgenerate

endmodule

module adder(in1,in2,c,s,cin);
input in1,in2,cin;
output c,s;

assign {c , s} = in1 + in2 + cin;

endmodule 
