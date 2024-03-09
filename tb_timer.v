`timescale 1ns / 1ps
module tb_timer();
    reg clk_in, arst;
    wire t;
    
    timer T(.clk_in(clk_in),.arst(arst),.t(t));
    
    always #80 clk_in=~clk_in;
    
    initial begin
    clk_in=0;
    arst=1;
    #10
    
    arst=0;
    
    #250000;
    $finish;
    
    end

endmodule
