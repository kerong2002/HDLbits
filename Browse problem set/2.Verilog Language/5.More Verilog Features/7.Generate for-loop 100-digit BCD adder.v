//2022-06-05 陳科融
//Generate for-loop: 100-digit BCD adder
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

wire [99:0] cout_save;
generate 
    genvar i;
    for(i=0;i<100;i=i+1) begin :add
        if(i==0) begin
            bcd_fadd body1(
                        .a(a[3:0]),
                        .b(b[3:0]),
                        .cin(cin),
                        .cout(cout_save[0]),
                        .sum(sum[3:0])
                        );
        end
        else begin
            bcd_fadd body2(
                        .a(a[i*4+3:i*4]),
                        .b(b[i*4+3:i*4]),
                        .cin(cout_save[i-1]),
                        .cout(cout_save[i]),
                        .sum(sum[i*4+3:i*4]));
        end
    end
    assign cout=cout_save[99];
endgenerate

endmodule
