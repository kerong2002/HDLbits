//2022_11_2 kerong
//4-bit shift register
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

always @(posedge clk,posedge areset) begin
    if(areset)begin
        q <= 4'd0;
    end
    else begin
        if(load)begin
            q <= data;
        end
        else if(ena)begin
            q <= q >> 1;
        end
        else begin
            q <= q;
        end
    end
end

endmodule
