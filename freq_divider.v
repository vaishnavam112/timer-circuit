`timescale 1ns / 1ps
module freq_divider #(parameter N=4)(
     input clk,arst,
     output out
    );
    reg[3:0] count;
    
    always @(posedge clk or posedge arst)
        begin
            if(arst)
                count = 0;
                else 
                  count <= count+1;  
        end
        assign out = count[3];
endmodule