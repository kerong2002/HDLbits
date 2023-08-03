//2023_7_9 kerong
//FSM
module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;

    reg [1:0] state, nstate;
    reg [3:1] reg_g;

    assign g = reg_g;

    always@(posedge clk) begin
        if(!resetn)begin
            state <= A;
        end
        else begin
            state <= nstate;
        end
    end

    always@(*)begin
        case(state)
            A:begin
                casex({r[1], r[2], r[3]})
                    3'b000:nstate = A;
                    3'b001:nstate = D;
                    3'b01x:nstate = C;
                    3'b1xx:nstate = B;
                endcase
            end
            B:begin
                casex(r[1])
                    1'b0:nstate = A;
                    1'b1:nstate = B;
                endcase
            end
            C:begin
                casex(r[2])
                    1'b0:nstate = A;
                    1'b1:nstate = C;
                endcase
            end
            D:begin
                casex(r[3])
                    1'b0:nstate = A;
                    1'b1:nstate = D;
                endcase
            end
        endcase
    end

    always@(*)begin
        case(state)
            A:reg_g = 3'b000;
            B:reg_g = 3'b001;
            C:reg_g = 3'b010;
            D:reg_g = 3'b100;
        endcase
    end
    
endmodule
