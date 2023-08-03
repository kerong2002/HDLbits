//2023_7_9 kerong
//Another FSM
module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter IDLE = 4'd0;
    parameter A = 4'd1;
    parameter B = 4'd2;
    parameter C = 4'd3;
    parameter D = 4'd4;
    parameter E = 4'd5;
    parameter F = 4'd6;
    parameter O = 4'd8;
    parameter Z = 4'd9;
    reg [4:0] state, nstate;

    always@(posedge clk)begin
        if(~resetn)begin
            state <= IDLE;
        end
        else begin
            state <= nstate;
        end
    end

    always@(*)begin
        case(state)
            IDLE:nstate = A;
            A:nstate = B;
            B:nstate = x ? C : B;
            C:nstate = x ? C : D;
            D:nstate = x ? E : B;
            E:nstate = y ? O : F;
            F:nstate = y ? O : Z;
            O:nstate = O;
            Z:nstate = Z;
            default:nstate = IDLE;
        endcase
    end

    assign f = (state == A);
    assign g = (state == E) | (state == F) | (state == O);

endmodule
