//2022_11_10 kerong
//Sequential circuit 7
module top_module (
    input clk,
    input a,
    output reg q );

    always @(posedge clk) begin
        q <= ~a; 
    end

endmodule
