//2022-06-05 陳科融
//Generate for-loop: 100-bit binary adder 2（adder100i）
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

integer i;
always @(*) begin
    {cout[0],sum[0]}=a[0]+b[0]+cin;
    for(i=1;i<100;i=i+1)begin
        {cout[i],sum[i]}=a[i]+b[i]+cout[i-1];
    end
end

endmodule
