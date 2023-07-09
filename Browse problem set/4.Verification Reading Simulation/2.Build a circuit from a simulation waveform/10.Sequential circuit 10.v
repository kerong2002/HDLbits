//2022_11_10 kerong
//Sequential circuit 10
module top_module (
    input clk,
    input a,
    input b,
    output q,
    output reg state  );


    always@(posedge clk)begin
        if(a == b)begin
        	state <= a;
        end
    end

    assign q = a ^ b ^ state;

endmodule
