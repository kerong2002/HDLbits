//2022_11_9 kerong
//Serial receiver with parity checking
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output reg done
); //

    // Modify FSM and datapath from Fsm_serialdata

    // New: Add parity checking.
    reg [3:0] state, next_state;
    wire odd, reset_p;
    parameter IDLE    = 4'd0;
    parameter START   = 4'd1;
    parameter S1      = 4'd2;
    parameter S2      = 4'd3;
    parameter S3      = 4'd4;
    parameter S4      = 4'd5;
    parameter S5      = 4'd6;
    parameter S6      = 4'd7;
    parameter S7      = 4'd8;
    parameter S8      = 4'd9;
    parameter PARITY  = 4'd10;
    parameter STOP    = 4'd11;
    parameter ERROR   = 4'd12;

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
            S8      : next_state = PARITY;
            PARITY  : next_state = in ? STOP : ERROR;
            STOP    : next_state = in ? IDLE : START;
            ERROR   : next_state = in ? IDLE : ERROR;
            default : next_state = IDLE;

        endcase
    end
    // New: Datapath to latch input bits.
    always @(posedge clk)begin
        if(reset)begin
            out_byte <= 8'd0;
        end
        else begin
            if(state >= START && state <S8)begin
                out_byte <= {in,out_byte[7:1]};
            end
            else begin
                out_byte <= out_byte;
            end
        end
    end

    assign reset_p = (next_state == START || reset == 1'b1);
    parity U1(clk, reset_p, in, odd);
    
    always @(posedge clk)begin
        if(reset)begin
            done <= 1'b0;
        end
        else if(next_state == STOP && odd == 1'b1)begin
            done <= 1'b1;
        end
        else begin
            done <= 1'b0;
        end
    end

endmodule
