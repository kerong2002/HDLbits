//2023_8_4 kerong
//3
module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output reg [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);
	always@(posedge clk, posedge areset)begin
		if(areset)begin
			predict_history <= 32'd0;
		end
		else begin
			casex({train_mispredicted, predict_valid})
				2'b1x:	predict_history <= {train_history[30:0], train_taken};
				2'b01:	predict_history <= {predict_history[30:0], predict_taken};
			endcase
		end
	end
endmodule
