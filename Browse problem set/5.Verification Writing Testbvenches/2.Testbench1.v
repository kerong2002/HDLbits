//2023_8_3 kerong
//Testbench1
`timescale 1ps / 1ps
module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial begin
        A = 1'b0;
        B = 1'b0;
        fork
            #10 A = 1'b1;
            #20 A = 1'b0;
            #15 B = 1'b1;
            #40 B = 1'b0;
        join
    end

endmodule
