//2022_11_3 kerong
//Design a Moore FSM
module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] state, next_state;
    parameter A  = 3'b000;
    parameter B0 = 3'b001;
    parameter B1 = 3'b010;
    parameter C0 = 3'b011;
    parameter C1 = 3'b100;
    parameter D  = 3'b101;

    always @(posedge clk) begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*)begin
        case(state)
            A  : next_state = s[1] ? B0 : A; 
            B0 : next_state = s[2] ? C0 : (s[1] ? B0 : A);
            B1 : next_state = s[2] ? C0 : (s[1] ? B1 : A);
            C0 : next_state = s[3] ? D  : (s[2] ? C0 : B1);
            C1 : next_state = s[3] ? D  : (s[2] ? C1 : B1);
            D  : next_state = s[3] ? D  : C1; 
            default : next_state = state;
        endcase
    end
    //out
    always @(*)begin
        case(state)
            A  : {fr3,fr2,fr1,dfr} = 4'b1111;
            B0 : {fr3,fr2,fr1,dfr} = 4'b0110;
            B1 : {fr3,fr2,fr1,dfr} = 4'b0111;
            C0 : {fr3,fr2,fr1,dfr} = 4'b0010;
            C1 : {fr3,fr2,fr1,dfr} = 4'b0011;
            D  : {fr3,fr2,fr1,dfr} = 4'b0000;
            default : {fr3,fr2,fr1,dfr} = 4'b0000;
        endcase
    end
endmodule
