`timescale 1ns / 1ps

module top_module(
    input clk, arst,
    output q_out
    );
  
    freq_divider FD(.clk(clk), .arst(arst), .out(out));
    timer T(.clk_in(out), .arst(arst),.t(q_out));
    
    
    
endmodule
