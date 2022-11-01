//2022_11_1 kerong
//Adder(Exams/m2014 q4j)
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire cout[3:0];
    generate
        genvar i;
        FA f1(x[0],y[0],0,cout[0],sum[0]);
        for(i=1;i<4;i=i+1)begin:add_generate
            FA f_name(x[i],y[i],cout[x-1],cout[x],sum[x]);
        end    
    endgenerate
    assign sum[4] = cout[3];
endmodule

module FA(in1,in2,cin,s,c);

input in1,in2,cin;
output s,c;

assign {c,s} = in1 + in2 + cin;

endmodule 

