//2022_10_31 kerong
//3-bit population count
module top_module( 
    input [2:0] in,
    output [1:0] out );
reg [1:0] cnt;

integer x;
always @(*) begin
    cnt = 2'd0;
    for(x=0;x<=2;x=x+1)begin
        cnt = cnt + in[x];
    end
end

assign out = cnt;

endmodule