//2023_7_9 kerong
//Counter with period 1000
module top_module (
    input clk,
    input reset,
    output [9:0] q);

    always@(posedge clk)begin
        if(reset)begin
            q <= 10'd0;
        end
        else begin
            if (q < 10'd999) begin
                q <= q + 10'd1;
            end
            else begin
                q <= 10'd0;
            end
        end
    end

endmodule
