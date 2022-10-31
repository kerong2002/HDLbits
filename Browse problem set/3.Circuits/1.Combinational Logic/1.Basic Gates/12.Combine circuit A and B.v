//2022_10_31 kerong
//Combine circuit A and B
module top_module (input x, input y, output z);
wire zA,zB;

assign zA = (x^y) &x;
assign zB = x~^y;
assign z  =  zA ^ zB;

endmodule