//2022_11_9
//PS/2 packet parser and datapath
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

    reg [1:0] state, next_state;
    parameter   S1      = 2'd0;
    parameter   S2      = 2'd1;
    parameter   S3      = 2'd2;
    parameter   DONE    = 2'd3;
    // FSM from fsm_ps2
    always @(posedge clk)begin
        if(reset)begin
            state <= S1;
        end
        else begin
            state <= next_state;
        end
    end
    
    // New: Datapath to store incoming bytes.
    always @(*)begin
        case(state)
            S1 : next_state = in[3] ? S2 : S1;
            S2 : next_state = S3;
            S3 : next_state = DONE;
            DONE : next_state = in[3] ? S2 : S1;
        endcase
    end
    always @(posedge clk) begin
        if(reset)begin
            out_bytes <= 24'd0;
        end
        else begin
            if(S1 && ~in[3])begin
                out_bytes <= 24'd0;
            end
            else begin
                out_bytes <= {out_bytes[16:0],in};
            end
        end
    end
    assign done = (state == DONE);

endmodule
