//2023_7_9 kerong
//FSM logic
module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    reg [2:0] reg_Y0;
    reg reg_z;
    
    assign Y0 = reg_Y0[0];
    assign z = reg_z;

    always @(*) begin
        case(y)
            3'b000:reg_Y0 = x ? 3'b001 : 3'b000;
            3'b001:reg_Y0 = x ? 3'b100 : 3'b001;
            3'b010:reg_Y0 = x ? 3'b001 : 3'b010;
            3'b011:reg_Y0 = x ? 3'b010 : 3'b001;
            3'b100:reg_Y0 = x ? 3'b100 : 3'b011;
            default:reg_Y0 = 3'b000;
        endcase    
    end

    always@(*)begin
        case(y)
            3'b000:reg_z = 1'b0;
            3'b001:reg_z = 1'b0;
            3'b010:reg_z = 1'b0;
            3'b011:reg_z = 1'b1;
            3'b100:reg_z = 1'b1;
            default:reg_z = 1'b0;
        endcase
    end

endmodule
