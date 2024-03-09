`timescale 1ns / 1ps


module d_flops(
    input d,clk,arst,
    output reg q
    );
    always @(posedge clk, posedge arst)
    begin
        if(arst==1)
            q <= 1'b0;
            else q <= d;
            
    end
    
endmodule
