//2022_11_9 kerong
//Design a Mealy FSM
module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    reg [1:0] state, next_state;

    parameter   S0 = 2'b00;
    parameter   S1 = 2'b01;
    parameter   S2 = 2'b10;
    parameter   S3 = 2'b11;

    always @(posedge clk, negedge aresetn) begin
        if(!aresetn)begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            S0 : next_state = x ? S1 : S0;
            S1 : next_state = x ? S1 : S2;
            S2 : next_state = x ? S3 : S0;
            S3 : next_state = x ? S1 : S2;
        endcase
    end

    assign z = (next_state == S3);

endmodule
