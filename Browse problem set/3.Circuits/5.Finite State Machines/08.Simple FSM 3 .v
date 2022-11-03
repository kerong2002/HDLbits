//2022_11_3 kerong
//Simple FSM 3 
module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    reg [1:0] state,next_state;
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
    // State transition logic
    always @(*) begin
        case(state)
            A : begin
                case(in)
                    1'b0 : next_state = A;
                    1'b1 : next_state = B;
                endcase
            end
            B : begin
                case(in)
                    1'b0 : next_state = C;
                    1'b1 : next_state = B;
                endcase
            end
            C : begin
                case(in)
                    1'b0 : next_state = A;
                    1'b1 : next_state = D;
                endcase
            end
            D : begin
                case(in)
                    1'b0 : next_state = C;
                    1'b1 : next_state = B;
                endcase
            end
        endcase
    end
    // State flip-flops with synchronous reset
    always @(posedge clk)begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end
    // Output logic
    assign out = (state == D) ? 1'b1 : 1'b0;
endmodule
