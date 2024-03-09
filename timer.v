`timescale 1ns / 1ps
module timer #(parameter N=4)(
    input clk_in, arst,
    output reg t
    );
    reg[3:0] q;
     always @(posedge clk_in, posedge arst)
     begin
        if(arst) begin
          q <= 4'b0000;
          t <= 0;
        end
          else if(q == 4'b1001) begin
                t <= 1;
                q <= 4'b0000;
          end else 
                q <= q+1;
     end
endmodule