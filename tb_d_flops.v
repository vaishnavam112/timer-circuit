`timescale 1ns / 1ps
module tb_d_flops();
    reg d, clk, arst;
    wire q;
    
    d_flops df(.d(d), .clk(clk), .arst(arst), .q(q));
    
    always #5 clk=~clk;
    
    initial
    begin
        forever
            d=$random;
            #5;
    
    end
endmodule
