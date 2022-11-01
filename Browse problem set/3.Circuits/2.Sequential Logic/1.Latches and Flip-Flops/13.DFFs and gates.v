//2022_11_1 kerong
//DFFs and gates
module top_module (
    input clk,
    input x,
    output z
); 
reg [2:0] Q;
always @(posedge clk) begin
    Q[0] <= x | ~Q[0];
    Q[1] <= x & ~Q[1];
    Q[2] <= x ^ Q[2];
end 

assign z <= ~(|Q);

endmodule
