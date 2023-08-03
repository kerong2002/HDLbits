//2023_7_9 kerong
//FSM: Sequence 1101 recognizer
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    reg[2:0] state, nstate;
    
    

    parameter A = 3'd0;
    parameter B = 3'd1;
    parameter C = 3'd2;
    parameter D = 3'd3;
    parameter E = 3'd4;


    always@(posedge clk)begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= nstate;
        end
    end

    always@(*)begin
        case(state)
            A:nstate = data ? B : A;
            B:nstate = data ? C : A;
            C:nstate = data ? C : D;
            D:nstate = data ? E : A;
            E:nstate = E;
        endcase
    end

   assign start_shifting = (state == E);
    
endmodule
