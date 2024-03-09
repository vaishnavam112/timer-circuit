`timescale 1ns / 1ps

module tb_clkdiv_using_gen();
    reg clk, arst, d;
    wire out;
    
    clkdiv_using_gen dut(.clk(clk), .arst(arst), .d(d), .out(out));
    
    always #10 clk= ~clk;
    initial
    begin 
        clk=0;
        arst=1;
        d=0;
        #10;
        
        arst=0;
        #500;
        $finish;
        
    end
    
    initial begin
    $display("This is how top module is used using generate block");
    $monitor("time=%0t, clk=%0b arst=%0b d=%0b", $time, clk, arst,d);
    
    end
    
endmodule
