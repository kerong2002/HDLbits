//2022-06-05 陳科融
//Conditional ternary operator（Conditional）
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

wire [7:0] save [1:0];
    // assign intermediate_result1 = compare? true: false;
assign save[0]=(a>=b)?b:a;
assign save[1]=(c>=d)?d:c;
assign min=(save[0]>=save[1])?save[1]:save[0];

endmodule
