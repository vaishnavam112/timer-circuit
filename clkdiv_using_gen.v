`timescale 1ns / 1ps

module clkdiv_using_gen(
    input clk, arst,d, 
    output out
    );
    wire [3:0]din;
    wire [3:0]clk_div;
    
    d_flops df_inst0(.clk(clk), .arst(arst), .d(din[0]), .q(clk_div[0]));
    
    genvar i; 
    
generate
        for(i=1; i<4; i=i+1)
        begin
            d_flops df_inst (.clk(clk_div[i-1]),
                              .arst(arst),
                              .d(din[i]),
                              .q(clk_div[i]));
        end
endgenerate
    
    assign din = ~clk_div;
    assign out = clk_div[3];
    
    
endmodule
