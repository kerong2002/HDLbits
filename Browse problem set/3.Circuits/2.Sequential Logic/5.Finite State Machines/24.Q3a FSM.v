//2022_11_9 kerong
//FSM
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    reg state,next_state;
    reg [1:0] cnt;
    reg [1:0] find;
    parameter A = 1'b0;
    parameter B = 1'b1;	
	wire add;
    always @(posedge clk) begin
        if(reset)begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            A : next_state = s ? B : A;
            B : next_state = B;
        endcase
    end
    
	assign add = (state==B);
    assign z = (state==B) && (cnt==2) && (find==2);

    always @(posedge clk) begin
        if(reset)begin
            cnt  <= 2'd2;
            find <= 2'd0;
        end
        else begin
            case(state)
                A : begin
                    cnt  <= 2'd2;
                    find <= 2'd0;
                end
                B : begin
                    if(cnt == 2'd2)begin
                        cnt  <= 2'd0;
                        find <= w;
                    end
                    else begin
                        cnt  <= cnt + 2'd1;
                        find <= find + w;
                    end
                end
            endcase
        end
    end

endmodule
