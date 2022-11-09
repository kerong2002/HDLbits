//2022_11_3 kerong
//10 Lemmings 1
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    parameter LEFT  = 1'b0;
    parameter RIGHT = 1'b1;
    reg state, next_state;


    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)begin
            state <= LEFT;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        // State transition logic
        case(state)
            LEFT:begin
                if(bump_left)begin
                    next_state = RIGHT;
                end
                else begin
                    next_state = LEFT;
                end
            end
            RIGHT:begin
                if(bump_right)begin
                    next_state = LEFT;
                end
                else begin
                    next_state = RIGHT;
                end
            end
        endcase
    end
    // Output logic
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
