//2023_7_9 kerong
//FSM one-hot next-state logic
module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    assign Y4 = |{y[2], y[3], y[5], y[6]} & w; 
    assign Y2 = y[1] & ~w;

endmodule
