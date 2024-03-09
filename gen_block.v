`timescale 1ns / 1ps
// If you want to create a single file and include timer and freq divider then create single module,
//no need to create 3 modules in one file. and no need to create top module,
//since we can directly join timer and freq divi,
//we use top module only when we have to connect two or more modules...

module freq_div (
     input clk,arst,
     output out
    );
    reg count;
    always @(posedge clk or posedge arst)
        begin
            if(arst)
                count <= 0;
                else 
                  count <= count+1;
        end
        assign out = count;
endmodule


module timerr (
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


//A top level module that contains the instances of flip flops.
module top_design #(parameter N=4)(
    input clk,clk_in,arst,
    output out,t
);

    genvar i;
    
    generate
    begin
        for(i=0;i<=3;i=i+1)begin
            freq_div fd(.clk(clk), .arst(arst), .out(out));
            end 
            timerr tt(.clk(out),.arst(arst), .t(t));
    end        
    endgenerate
    
endmodule
