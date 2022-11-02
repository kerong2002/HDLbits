//2022_11_2 kerong
//4-digit decimal counter
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q);
wire overflow;
always @(posedge clk) begin
    if(reset)begin
        q <= 16'd0;
    end
    else begin
        case ({overflow,ena})
            4'b1111 : begin
                q[15:12] <= 4'd0;
                q[11:8]  <= 4'd0;
                q[7:4]   <= 4'd0;
                q[3:0]   <= 4'd0;
            end
            4'b0111 : begin
                q[15:12] <= q[15:12] + 1;
                q[11:8]  <= 4'd0;
                q[7:4]   <= 4'd0;
                q[3:0]   <= 4'd0;
            end
            4'b0011:begin
                q[15:12] <= q[15:12];
                q[11:8]  <= q[11:8] + 1;
                q[7:4]   <= 4'd0;
                q[3:0]   <= 4'd0;
            end
            4'b0001:begin
                q[15:12] <= q[15:12];
                q[11:8]  <= q[11:8];
                q[7:4]   <= q[7:4] + 1;
                q[3:0]   <= 4'd0;
            end
            default:q[3:0] <= q[3:0] + 1;
        endcase
    end
end

assign ena[1]   = q[3:0] == 4'd9 ? 1'b1 : 1'b0;
assign ena[2]   = ena[1] && q[7:4] == 4'd9 ? 1'b1 : 1'b0; 
assign ena[3]   = ena[2] && q[11:8] == 4'd9 ? 1'b1 : 1'b0; 
assign overflow = ena[3]  && q[15:12] == 4'd9 ? 1'b1 : 1'b0;

endmodule
