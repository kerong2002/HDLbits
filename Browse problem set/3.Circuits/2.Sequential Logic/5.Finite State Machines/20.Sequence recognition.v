//2022_11_9 kerong
//Sequence recognition

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);


    reg [3:0] state, next_state;
    parameter   S1    = 4'd0;
    parameter   S2    = 4'd1;
    parameter   S3    = 4'd2;
    parameter   S4    = 4'd3;
    parameter   S5    = 4'd4;
    parameter   S6    = 4'd5;
    parameter   S7    = 4'd6;
    parameter   DISC  = 4'd7;
    parameter   FLAG  = 4'd8;
    parameter   ERROR = 4'd9;

    always @(posedge clk)begin
        if(reset)begin
            state <= S1;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*)begin
        case(state)
            S1    : next_state = in ? S2 : S1;
            S2    : next_state = in ? S3 : S1;
            S3    : next_state = in ? S4 : S1;
            S4    : next_state = in ? S5 : S1;
            S5    : next_state = in ? S6 : S1;
            S6    : next_state = in ? S7 : DISC;
            S7    : next_state = in ? ERROR : FLAG;
            DISC  : next_state = in ? S2 : S1;
            FLAG  : next_state = in ? S2 : S1;
            ERROR : next_state = in ? ERROR : S1; 
            default : next_state = S1;
        endcase
    end

    assign disc = (state == DISC);
    assign flag = (state == FLAG);
    assign err  = (state == ERROR);

endmodule
