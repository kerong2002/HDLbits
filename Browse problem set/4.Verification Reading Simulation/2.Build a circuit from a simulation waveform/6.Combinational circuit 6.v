//2022_11_10 kerong
//Combinational circuit 6
module top_module (
    input [2:0] a,
    output reg [15:0] q ); 

    always @(*) begin
        case(a)
            4'd0 : q = 16'h1232;
            4'd1 : q = 16'haee0;
            4'd2 : q = 16'h27d4;
            4'd3 : q = 16'h5a0e;
            4'd4 : q = 16'h2066;
            4'd5 : q = 16'h64ce;
            4'd6 : q = 16'hc526;
            4'd7 : q = 16'h2f19;
        endcase
    end

endmodule
