//2023_8_3 kerong
//The complete timer
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	
	reg [3:0] state, nstate;
	reg [3:0] delay;
	reg [13:0] cnt_delay;
	wire done_counting;

	parameter S0		= 4'd0;
	parameter S1		= 4'd1;
	parameter S2		= 4'd2;
	parameter S3		= 4'd3;
	parameter B0	 	= 4'd4;
	parameter B1 		= 4'd5;
	parameter B2 		= 4'd6;
	parameter B3 		= 4'd7;
	parameter CNT 		= 4'd8;
	parameter WAIT		= 4'd9;

	assign done_counting = (cnt_delay == (delay + 1) * 1000 - 1);
    assign count 		 = delay - cnt_delay / 1000;
    assign counting  	 = state == CNT;
    assign done 		 = state == WAIT;

	
	always@(posedge clk)begin
		if(reset)begin
			state <= S0;
		end
		else begin
			state <= nstate;
		end
	end

	always@(*)begin
		case(state)
			S0:			nstate = data ? S1 : S0;
			S1: 		nstate = data ? S2 : S0;
			S2: 		nstate = data ? S2 : S3;
			S3: 		nstate = data ? B0 : S0;
			B0: 		nstate = B1;
			B1: 		nstate = B2;
			B2: 		nstate = B3;
			B3: 		nstate = CNT;
			CNT:		nstate = done_counting ? WAIT : CNT;
			WAIT:		nstate = ack ? S0 : WAIT;
			default:	nstate = S0;
		endcase
	end

	always@(posedge clk)begin
		if(reset)begin
			delay <= 4'd0;
		end
		else begin
			case(state)
				B0:		delay <= {delay[2:0], data};
				B1:		delay <= {delay[2:0], data};
				B2:		delay <= {delay[2:0], data};
				B3:		delay <= {delay[2:0], data};
			endcase
		end
	end

	always@(posedge clk)begin
		if(reset)begin
			cnt_delay <= 14'd0;
		end
		else begin
			case(state)
				CNT: 		cnt_delay <= cnt_delay + 14'd1;
				default:	cnt_delay <= 14'd0;
			endcase
		end
	end


endmodule