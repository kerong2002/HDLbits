//2022-06-04 陳科融
//Modules and vectors（Module shift8）
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

wire [7:0]dff8_out [3:0];

my_dff8 body1(.clk(clk),
              .d(d),
              .q(dff8_out[0])
             );
my_dff8 body2(.clk(clk),
              .d(dff8_out[0]),
              .q(dff8_out[1])
             );
my_dff8 body3(.clk(clk),
              .d(dff8_out[1]),
              .q(dff8_out[2])
             );

always @(*) begin
    case(sel)
        2'b00:q=d;
        2'b01:q=dff8_out[0];
        2'b10:q=dff8_out[1];
        2'b11:q=dff8_out[2];
    endcase
end

endmodule