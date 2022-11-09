//2022_11_3 kerong
//Simple FSM 2
module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(posedge clk) begin
        // State flip-flops with asynchronous reset
        if(reset)begin
            state <= OFF;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        // State transition logic
        case(state)
            OFF:begin
                case(j)
                    1'b0 : next_state = OFF;
                    1'b1 : next_state = ON;
                endcase
            end
            ON:begin
                case(k)
                    1'b0 : next_state = ON;
                    1'b1 : next_state = OFF;
                endcase
            end
        endcase
    end
    // Output logic
    assign out = (state == ON) ? 1'b1 : 1'b0;

endmodule
