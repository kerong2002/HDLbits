//2022_11_9 kerong
//Serial two's complementer
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg  state, next_state;
    parameter   S0 = 1'b0;
    parameter   S1 = 1'b1;

    always @(posedge clk, posedge areset) begin
        if(areset)begin
            state <= S0;
        end    
        else begin
            state <= next_state;
        end
    end

    always @(*)begin
        case(state)
            S0 : next_state = x ? S1 : S0;
            S1 : next_state = S1;
            default : next_state = S0;
        endcase
    end
    
    assign  z = (state == S0) ?  x : ~x;  


endmodule
