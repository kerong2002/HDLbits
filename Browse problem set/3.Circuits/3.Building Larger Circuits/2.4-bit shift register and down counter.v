//2023_7_9 kerong
//4-bit shift register and down counter
module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);


    always@(posedge clk)begin
        if(shift_ena)begin
            q <= {q[2:0], data};
        end
        else if (count_ena)begin
            q <= q - 4'd1;
        end
    end

endmodule
