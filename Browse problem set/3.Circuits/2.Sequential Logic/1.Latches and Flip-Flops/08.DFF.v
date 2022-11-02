//2022_11_1 kerong
//DFF
module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output reg q);

always @(posedge clk,posedge ar)begin
    if(ar)begin
        q <= 1'b0;
    end
    else begin
        q <= d;
    end
end

endmodule
