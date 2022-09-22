//2022-06-04 陳科融
//Vector reversal 1（Vectorr）
module top_module( 
    input [7:0] in,
    output [7:0] out
);
//由於out為wire，想使用for，所以透過generate去包，記得for要begin:(循環實例化名稱)
generate
	genvar i;
	for(i=0;i<8;i=i+1)begin:rev
		 assign out[i]=in[7-i];
	end
endgenerate

endmodule 