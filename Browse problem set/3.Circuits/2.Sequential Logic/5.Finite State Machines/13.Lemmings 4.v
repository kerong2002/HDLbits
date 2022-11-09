//2022_11_8 kerong
//Lemmings 4
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
    reg [4:0]   cnt;
    wire        DIED;
    parameter   LEFT          = 3'd0;
    parameter   RIGHT         = 3'd1;
    parameter   GROUND_LEFT   = 3'd2;
    parameter   GROUND_RIGHT  = 3'd3;
    parameter   DIG_LEFT      = 3'd4;
    parameter   DIG_RIGHT     = 3'd5;
    parameter   DOWN          = 3'd6;
    parameter   END_GAME      = 3'd7;
    always @(posedge clk, posedge areset)begin
        if(areset)begin
            state <= LEFT;
        end
        else begin
            state <= next_state;
        end
    end

    always @(posedge clk, posedge areset)begin
        if(areset)begin
            cnt  <= 5'd0;
        end
        else begin
            case(state)
                GROUND_RIGHT:begin
                    cnt <= cnt + 5'd1;
                end
                GROUND_LEFT:begin
                    cnt <= cnt + 5'd1;
                end
                default : cnt  <= 5'd0;
            endcase
        end 
    end

    assign DIED = (cnt == 5'd19);

    always @(*)begin
        case(state)
            LEFT:begin
                next_state = ground ? (dig ? DIG_LEFT : (bump_left ? RIGHT : LEFT)) : GROUND_LEFT;
            end
            RIGHT:begin
                next_state = ground ? (dig ? DIG_RIGHT : (bump_right ? LEFT : RIGHT)) : GROUND_RIGHT;
            end
            GROUND_LEFT:begin
                next_state = ground ? LEFT :  ((DIED) ? DOWN :GROUND_LEFT);
            end
            GROUND_RIGHT:begin
                next_state = ground ? RIGHT : ((DIED) ? DOWN : GROUND_RIGHT);
            end
            DIG_LEFT:begin
                next_state = ground ? DIG_LEFT : GROUND_LEFT;
            end
            DIG_RIGHT:begin
                next_state = ground ? DIG_RIGHT : GROUND_RIGHT;
            end
            DOWN : begin
                next_state = ground ? END_GAME : DOWN;
            end
            END_GAME:begin
                next_state = END_GAME;
            end
            default:next_state = LEFT;
        endcase
    end

    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign digging    = (state == DIG_LEFT || state == DIG_RIGHT);
    assign aaah       = (state == GROUND_LEFT || state == GROUND_RIGHT || state == DOWN);


endmodule
