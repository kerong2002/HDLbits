//2023_8_4 kerong
//2
module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg [1:0] state
);
	always@(posedge clk, posedge areset)begin
		if(areset)begin
			state <= 2'd1;
		end
		else begin
			case({train_valid, train_taken})
				2'b10:begin
					state <= state == 2'd0 ? state : state - 2'd1;
				end
				2'b11:begin
					state <= state == 2'd3 ? state : state + 2'd1;
				end
			endcase
		end
	end
endmodule
