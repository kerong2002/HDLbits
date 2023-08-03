//2023_7_10 kerong
//FSM The complete FSM

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter S0 = 3'd0;
    parameter S1 = 3'd1;
    parameter S2 = 3'd2;
    parameter S3 = 3'd3;
    parameter S4 = 3'd4;
    parameter S5 = 3'd5;
    parameter S6 = 3'd6;

    reg[2:0] cnt;
    reg[2:0] state, nstate;
    assign shift_ena = (state == S4);
    assign counting = (state == S5);
	assign done = (state == S6);

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
            S0:nstate = data ? S1 : S0;
            S1:nstate = data ? S2 : S0;
            S2:nstate = data ? S2 : S3;
            S3:nstate = data ? S4 : S0;
            S4:nstate = (cnt == 3'd3) ? S5 : S4;
            S5:nstate = (done_counting) ? S6 : S5;
            S6:nstate = (ack) ? S0 : S6;
        endcase
    end

    always@(posedge clk)begin
        if(reset)begin
            cnt <= 3'd0;
        end
        else begin
            case(state)
                S4:cnt <= cnt + 3'd1;
                default:cnt <= 3'd0;
            endcase
        end
    end

endmodule
