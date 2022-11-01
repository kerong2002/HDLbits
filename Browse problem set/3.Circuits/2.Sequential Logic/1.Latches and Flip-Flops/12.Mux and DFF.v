//2022_11_1 kerong
//Mux and DFF
module top_module (
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
