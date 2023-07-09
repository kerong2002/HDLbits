//2023_7_8 kerong
//FSM
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    reg [2:0] state, nstate;

    always@(posedge clk)begin
        if(reset)begin
            state <= 3'd0;
        end
        else begin
            state <= nstate;
        end
    end
    
    always@(*)begin
        case(state)
            3'b000:nstate = x ? 3'b001 : 3'b000;
            3'b001:nstate = x ? 3'b100 : 3'b001;
            3'b010:nstate = x ? 3'b001 : 3'b010;
            3'b011:nstate = x ? 3'b010 : 3'b001;
            3'b100:nstate = x ? 3'b100 : 3'b011;
            default:nstate = 3'b000;
        endcase
    end

    always@(*)begin
        case(state)
            3'b011:z <= 1'b1;
            3'b100:z <= 1'b1;
            default:z <= 1'b0;
        endcase
    end

endmodule