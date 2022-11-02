//2022_11_2 kerong
//Show decade counter
module top_module (
    input clk,
    input slowena,
    input reset,
    output reg[3:0] q);

always @(posedge clk)begin
    if(reset)begin
        q <= 4'd0;
    end
    else begin
        if(q <9)begin
            q <= q + slowena;
        end
        else begin
            if(slowena)
                q <= 4'd0;
            else
                q <= q;
        end
    end
end

endmodule
