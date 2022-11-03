//2022_11_3 kerong
//Simple FSM 1
// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 1'b0;
    parameter B = 1'b1;
    reg present_state, next_state;
    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
        end else begin
            present_state <= next_state;
        end
    end
    always @(*)begin
        case(present_state)
            A:begin
                case(in)
                    1'b0 : next_state = B;
                    1'b1 : next_state = A;
                endcase
            end
            B:begin
                case(in)
                    1'b0 : next_state = A;
                    1'b1 : next_state = B;
                endcase
            end
        endcase
    end
    always @(*)begin
        out = (present_state == B) ? 1'b1 : 1'b0;
    end
endmodule
