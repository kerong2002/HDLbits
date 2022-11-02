//2022_11_2 kerong
//Four-bit binary counter
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg[3:0] q);


always @(posedge clk) begin
    if(reset)begin
        q <= 4'd0;
    end
    else begin
        if(q < 15)begin
            q <= q + 1;
        end
        else begin
            q <= 4'd0;
        end
    end
end
endmodule
