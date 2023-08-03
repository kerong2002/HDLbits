//2023_7_9 kerong
//FSM
module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    parameter A = 3'b000;
    parameter B = 3'b001;
    parameter C = 3'b010;
    parameter D = 3'b011;
    parameter E = 3'b100;
    parameter F = 3'b101;

    reg[2:0] state, nstate;
    reg reg_z;

    assign z = reg_z;

    always@(posedge clk) begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= nstate;
        end
    end

    always@(*)begin
        case(state)
            A:nstate = w ? A : B;
            B:nstate = w ? D : C;
            C:nstate = w ? D : E;
            D:nstate = w ? A : F;
            E:nstate = w ? D : E;
            F:nstate = w ? D : C;
            default:nstate = A;
        endcase
    end

    always@(*)begin
        case(state)
            A:reg_z = 1'b0;
            B:reg_z = 1'b0;
            C:reg_z = 1'b0;
            D:reg_z = 1'b0;
            E:reg_z = 1'b1;
            F:reg_z = 1'b1;
            default:reg_z = 1'b0;
        endcase
    end

endmodule
