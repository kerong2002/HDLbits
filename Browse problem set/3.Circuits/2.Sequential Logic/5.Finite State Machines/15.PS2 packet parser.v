//2022_11_9 kerong
//PS/2 packet parser
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg [1:0] state, next_state;
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    // State transition logic (combinational)
    always @(*) begin
        case (state)
            S0 : next_state = in[3] ? S1 : S0;
            S1 : next_state = S2;
            S2 : next_state = S3;
            S3 : next_state = in[3] ? S1 : S0;
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset)begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end
    // Output logic
    assign done = (state == S3);
endmodule
