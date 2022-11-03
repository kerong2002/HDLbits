//2022_11_3 kerong
//Conway's Game of Life 16x16
module div9(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 

reg [255:0] next_q;
reg [3:0]sum;
integer x;

always @(posedge clk)begin
    if(load)begin
        q <= data;
    end
    else begin
        q <= next_q;
    end
end
always @(*)begin
    for(x=0;x<=255;x=x+1)begin
		if(x==0)begin
			sum = q[255] + q[240] + q[241] + q[15] + q[1] + q[31] + q[16] + q[17];
		end
		else if(x == 15)begin
			sum = q[254] + q[255] + q[240] + q[14] + q[0] + q[30] + q[31] + q[16];
		end
		else if(x == 240)begin
			sum = q[239] + q[224] + q[225] + q[255] + q[241] + q[15] + q[0] + q[1];
		end
		else if(x == 255)begin
			sum = q[238] + q[239] + q[224] + q[254] + q[240] + q[14] + q[15] + q[0];
		end
		else if(x> 0 && x<15)begin
			sum = q[x+239] + q[x+240] + q[x+241] + q[x-1] + q[x+1] + q[x+15] + q[x+16] + q[x+17];
		end
		else if(x>240 && x<255)begin
			sum = q[x-17] + q[x-16] + q[x-15] + q[x-1] + q[x+1] + q[x-241] + q[x-240] + q[x-239];
		end
        else if(x%16 == 0)begin
			sum = q[x-1] + q[x-16] + q[x-15] + q[x+15] + q[x+1] + q[x+31] + q[x+16] + q[x+17];
		end
        else if(x%16 == 15)begin
			sum = q[x-17] + q[x-16] + q[x-31] + q[x-1] + q[x-15] + q[x+15] + q[x+16] + q[x+1];
		end
		else begin
			sum = q[x-17] + q[x-16] + q[x-15] + q[x-1] + q[x+1] + q[x+15] + q[x+16] + q[x+17];
		end
        case(sum)
            4'd2 : next_q[x] <= q[x];
            4'd3 : next_q[x] <= 4'd1;
            default : next_q[x] <= 4'd0;
        endcase
    end
end

endmodule
