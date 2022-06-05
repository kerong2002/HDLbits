//2022-06-05 陳科融
//Combinational for-loop: 255-bit population count（Popcount255）
module top_module( 
    input [254:0] in,
    output [7:0] out );

integer i;
always @(*) begin
    out=0;
    for(i=0;i<255;i=i+1)begin
        if(in[i])begin
            out=out+1;
        end
        else begin
            out=out;
        end
    end
end

endmodule
