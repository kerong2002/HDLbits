//2022_11_8 kerong
//Lemmings 2
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah); 

    reg [1:0] next_state;
    reg [1:0] state;
    parameter   LEFT  = 2'b00;
    parameter   RIGHT = 2'b01;
    parameter   GROUND_LEFT = 2'b10;
    parameter   GROUND_RIGHT = 2'b11;

    always @(posedge clk,posedge areset)begin
        if(areset)begin
            state <= LEFT;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*)begin
        case(state)
            LEFT:begin
                next_state = ground ? (bump_left ? RIGHT : LEFT) : GROUND_LEFT;
            end
            RIGHT:begin
                next_state = ground ? (bump_right ? LEFT : RIGHT) : GROUND_RIGHT;
            end
            GROUND_LEFT:begin
                next_state = ground ? LEFT : GROUND_LEFT;
            end
            GROUND_RIGHT:begin
                next_state = ground ? RIGHT : GROUND_RIGHT;
            end
        endcase
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == GROUND_LEFT || state == GROUND_RIGHT);

endmodule
