//2023_7_10 kerong
//FSM Enable shift register
module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);


    parameter RUN  = 1'd0;
    parameter STOP  = 1'd1;
    
    reg state, nstate;
    reg [2:0] cnt;

    always@(posedge clk)begin
        if(reset)begin
            state <= RUN;
        end
        else begin
            state <= nstate;
        end
    end

    always@(*)begin
        case(state)
            RUN:nstate = ((cnt == 3'd3) ? STOP : RUN);
            STOP:nstate = STOP;
        endcase
    end
    
    always@(posedge clk)begin
            case(state)
            RUN:cnt <= cnt + 3'd1;
            default:cnt <= 3'd0;
        endcase
    end

    assign shift_ena = (state == RUN);

endmodule