//2022-06-04 陳科融
//Replication operator（vector4）
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = {{24{in[7]}},in};

endmodule