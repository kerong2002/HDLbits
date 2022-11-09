//2022_11_8 kerong
//Lemmings 3
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    reg [3:0]   state,next_state;
    parameter   LEFT          = 3'd0;
    parameter   RIGHT         = 3'd1;
    parameter   GROUND_LEFT   = 3'd2;
    parameter   GROUND_RIGHT  = 3'd3;
    parameter   DIG_LEFT      = 3'd4;
    parameter   DIG_RIGHT     = 3'd5;

    always @(posedge clk, posedge areset)begin
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
                next_state = ground ? (dig ? DIG_LEFT : (bump_left ? RIGHT : LEFT)) : GROUND_LEFT;
            end
            RIGHT:begin
                next_state = ground ? (dig ? DIG_RIGHT : (bump_right ? LEFT : RIGHT)) : GROUND_RIGHT;
            end
            GROUND_LEFT:begin
                next_state = ground ? LEFT : GROUND_LEFT;
            end
            GROUND_RIGHT:begin
                next_state = ground ? RIGHT : GROUND_RIGHT;
            end
            DIG_LEFT:begin
                next_state = ground ? DIG_LEFT : GROUND_LEFT;
            end
            DIG_RIGHT:begin
                next_state = ground ? DIG_RIGHT : GROUND_RIGHT;
            end
            default:next_state = LEFT;
        endcase
    end

    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign digging    = (state == DIG_LEFT || state == DIG_RIGHT);
    assign aaah       = (state == GROUND_LEFT || state == GROUND_RIGHT);

endmodule
