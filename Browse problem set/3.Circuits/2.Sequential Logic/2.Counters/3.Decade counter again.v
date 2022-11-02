//2022_11_2 kerong
//Decade counter again
module top_module (
    input clk,
    input reset,
    output reg[3:0] q);

always @(posedge clk) begin
    if(reset)begin
        q <= 4'd1;
    end
    else begin
        if(q < 10)begin
            q <= q + 1;
        end
        else begin
            q <= 4'd1;
        end
    end
end

endmodule
