`timescale 1ns / 1ps

module tb_freq_divider();
    reg clk,arst;
    wire[3:0] count;
    wire out;
    integer i;
    
    freq_divider fd( .clk(clk),.out(out), .arst(arst), .count(count));
    
    always #5 clk = ~clk;
    
    initial begin
        
        clk=0;
        arst=1;
        #10;
        arst=0;
     
             
        #250;    
        $finish;
    end

endmodule
