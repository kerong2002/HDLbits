//2022_11_2 kerong
//12-hour clock
module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 

wire c_s,c_m,c_h;
wire one,two;
reg after;
//wire pm_night;
always @(posedge clk) begin
    if(reset)begin
        {hh,mm,ss} <= 24'h120000;
        pm <= 1'b0;
        after <= 1'b0;
    end
    else begin
        case({c_h,c_m,c_s})
            3'b111:begin
                {hh,mm,ss} <= 24'h010000;
                after <= after + 1'b1;
            end
            3'b011:begin
                mm = 8'h0;
                ss = 8'h0;
                if(after==1'b0 && hh==8'h11)begin
                    pm <= ~pm;
                end
                if(after==1'b1 && hh==8'h11)begin
                    {hh,mm,ss} <= 24'h120000;
                    pm <= ~pm;
                end
                else begin
                    if(hh[3:0]<9)begin
                        hh[3:0] <= hh[3:0] + 1'h1;
                    end
                    else begin
                        hh[3:0] <= 4'd0;
                        hh[7:4] <= hh[7:4] + 1'h1;
                    end 
                end
            end
            3'b001:begin
                ss = 8'h0;
                if(mm[3:0]<9)begin
                    mm[3:0] <= mm[3:0] + 1'h1;
                end
                else begin
                    mm[3:0] <= 4'd0;
                    mm[7:4] <= mm[7:4] + 1'h1;
                end
            end
            default : begin
                if(ss[3:0]<9)begin
                    ss[3:0] <= ss[3:0] + ena;
                end
                else begin
                    if(ena) begin
                        ss[3:0] <= 4'd0;
                        ss[7:4] <= ss[7:4] + 1'b1;
                    end
                    else begin
                        ss[3:0] <= ss[3:0];
                        ss[7:4] <= ss[7:4];
                    end
                end
            end
        endcase
    end
end

assign c_s = ss==8'h59 ? 1'b1 : 1'b0;
assign c_m = c_s && mm==8'h59 ? 1'b1 : 1'b0;
assign c_h = c_m && hh==8'h12 ? 1'b1 : 1'b0;
// assign one = c_m && after==0 ? 1'b1 : 1'b0;
// assign one = c_h && after==1 ? 1'b1 : 1'b0;
endmodule
