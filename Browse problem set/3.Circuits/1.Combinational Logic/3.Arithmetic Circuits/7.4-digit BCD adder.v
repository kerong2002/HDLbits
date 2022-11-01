//2022_11_1 kerong
//4-digit BCD adder
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [2:0] c;
    bcd_fadd u1(a[3:0],  b[3:0],  cin, c[0],sum[3:0]);
    bcd_fadd u1(a[7:4],  b[7:4],  c[0],c[1],sum[7:4]);
    bcd_fadd u1(a[11:8], b[11:8], c[1],c[2],sum[11:8]);
    bcd_fadd u1(a[15:12],b[15:12],c[2],cout,sum[15:12]);
    // generate
    //     genvar x;
    //     bcd_fadd u1(a[3:0],b[3:0],cin,c[0],sum[3:0]);
    //     for(x=1;x<3;x=x+1)begin:generate_bcd
    //         bcd_fadd name(a[4*x+:4],b[4*x+:4],c[x-1],c[x],sum[4*x+:4]);
    //     end
    //     bcd_fadd u2(a[15:12],b[15:12],c[2],cout,sum[15:12]);
    // endgenerate

endmodule
