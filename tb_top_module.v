`timescale 1ns / 1ps
module tb_top_module();
    reg clk, arst;
    wire q_out;
  top_module dut(.clk(clk), .arst(arst), .q_out(q_out));
    always #10 clk=~clk;
    
    initial begin
    clk=0;
    arst=1;
    #10
    arst=0;
    #1000
    $finish;
    end
    
    

endmodule
