//2022_11_3 kerong
//Simple state transitions 3
module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        case(state)
            A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
        endcase
    end
    // Output logic:  out = f(state) for a Moore state machine
    always @(*)begin
        case(state)
            D : out = 1'b1;
            default : out = 1'b0;
        endcase
    end
endmodule
