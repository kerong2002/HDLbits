//2022_11_2 kerong
//Shift register
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output reg[3:0] LEDR
); //



MUXDFF u0(
        .clk(KEY[0]),
        .w(KEY[3]),
        .L(KEY[2]),
        .E(KEY[1]),
        .R(SW[0]),
        .Q(LEDR[0])
);
MUXDFF u1(
        .clk(KEY[0]),
        .w(KEY[3]),
        .L(KEY[2]),
        .E(KEY[1]),
        .R(SW[1]),
        .Q(LEDR[1])
);
MUXDFF u2(
        .clk(KEY[0]),
        .w(KEY[3]),
        .L(KEY[2]),
        .E(KEY[1]),
        .R(SW[2]),
        .Q(LEDR[2])
);
MUXDFF u3(
        .clk(KEY[0]),
        .w(KEY[3]),
        .L(KEY[2]),
        .E(KEY[1]),
        .R(SW[3]),
        .Q(LEDR[3])
);

endmodule

//2022_11_1 kerong
//Mux and DFF
module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);

always @(posedge clk)begin
    if(L)begin
        Q <= R;
    end
    else begin
        if(E)begin
            Q <= w;
        end
        else begin
            Q <= Q;
        end
    end
end

endmodule
