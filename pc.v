`timescale 1ps/1ps
//`include "./mul2_1.v"
module pc(
          input [31:0]      pcaddr, branchaddr, jumpaddr,
          input             clk, branch1, zero,reset, jump,
          
          output reg [31:0] pcvalue);
    wire               pcsrc ;
    
    assign pcsrc = zero & branch1;
   // reg          [31:0]      prepc;
    
    always @ (posedge reset)
      pcvalue = 32'b0;
    
         
    always @(posedge clk)
      begin
/*       multiplexer(    .a(branchaddr),
                                            .b(pcaddr),
                                             .y(prepc),
                                            .s(pcsrc)
                                            );
          
          multiplexer(.a(jumpaddr),
                                         .b(prepc),
                                         .y(pcvalue),
                                         .s(jump)
                                         );
 always 语句中不能调用模块
 */
/*     assign prepc = pcsrc? branchaddr : pcaddr;
          assign pcvalue = jump ? jumpaddr : prepc;
  不行，因为assign语句是并行执行的
 */        
          
     //    prepc <= (pcsrc) ? branchaddr : pcaddr;
       //   pcvalue <= (jump)?  jumpaddr : prepc;
          
  
          
      
if(jump)
  pcvalue <= jumpaddr;
else if(pcsrc)
  pcvalue <= branchaddr;
else
  pcvalue <= pcaddr;
          


end // always @ (posedge clk)
    
endmodule // pc
