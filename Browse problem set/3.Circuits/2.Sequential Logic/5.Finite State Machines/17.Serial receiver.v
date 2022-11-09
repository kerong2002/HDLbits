//2022_11_9 kerong
//Serial receiver
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    reg [3:0] state, next_state;
    parameter IDLE  = 4'd0;
    parameter START = 4'd1;
    parameter S1    = 4'd2;
    parameter S2    = 4'd3;
    parameter S3    = 4'd4;
    parameter S4    = 4'd5;
    parameter S5    = 4'd6;
    parameter S6    = 4'd7;
    parameter S7    = 4'd8;
    parameter S8    = 4'd9;
    parameter STOP  = 4'd10;
    parameter ERROR = 4'd11;

    always @(posedge clk) begin
        if(reset)begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            IDLE    : next_state = in ? IDLE : START;
            START   : next_state = S1;
            S1      : next_state = S2;
            S2      : next_state = S3;
            S3      : next_state = S4;
            S4      : next_state = S5;
            S5      : next_state = S6;
            S6      : next_state = S7;
            S7      : next_state = S8;
            S8      : next_state = in ? STOP : ERROR;
            STOP    : next_state = in ? IDLE : START;
            ERROR   : next_state = in ? IDLE : ERROR;
            default : next_state = IDLE;

        endcase
    end

    assign done = (state == STOP);

endmodule
