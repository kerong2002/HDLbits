//2022_11_9 kerong
//One-hot FSM
module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    
    parameter S0 = 4'd0;
    parameter S1 = 4'd1;
    parameter S2 = 4'd2;
    parameter S3 = 4'd3;
    parameter S4 = 4'd4;
    parameter S5 = 4'd5;
    parameter S6 = 4'd6;
    parameter S7 = 4'd7;
    parameter S8 = 4'd8;
    parameter S9 = 4'd9;

    assign next_state[S0] = ~in & (state[S0] || state[S1] || state[S2]||state[S3] || state[S4] || state[S8] || state[S9] || state[S7]);
    assign next_state[S1] =  in & (state[S0] || state[S8] || state[S9]);
    assign next_state[S2] =  in & state[S1]; 
    assign next_state[S3] =  in & state[S2];
    assign next_state[S4] =  in & state[S3];
    assign next_state[S5] =  in & state[S4];
    assign next_state[S6] =  in & state[S5];
    assign next_state[S7] =  in & (state[S6] | state[S7]);
    assign next_state[S8] = ~in & state[S5];
    assign next_state[S9] = ~in & state[S6];

    assign out1 = (state[S8] || state[S9]);
    assign out2 = (state[S7] || state[S9]);

endmodule
