`timescale 1ps/1ps
`include "./single_cycle.v"
module test;
    reg reset, clk;
    
    
    //reg [31:0]  branchaddr, writedate;
    
    
/*    wire [1:0] ALUOP;
    
    wire       RegDst, Branch1,MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  */  
    
//    wire [31:0] date1, date2;
     //  wire [31:0] signextend_result;
    //wire [31:0] result;
    
    
    initial
      begin
          #0 reset = 0;
          #1 reset = ~ reset;
      end 
    initial
      begin
          #0 clk = 0;
          repeat(20)
            #400 clk = ~clk;
      end
    
   /* initial
      begin
          zero =0;
         // pcaddr = 'd2;
          branchaddr = 'd5;
          branch1 = 1;
          writedate = 'd3;
          
      end
    single_cycle single_cycle(.reset(reset),
                              .clk(clk),
                              .branch1(branch1),
                              .zero(zero),
//                              .pcaddr(pcaddr),
                              .branchaddr(branchaddr),
/*                              .ALUOP(ALUOP),
                              .RegDst(RegDst),
                              .Branch1(Branch1),
                              .MemRead(MemRead),
                              .MemWrite(MemWrite),
                              .MemtoReg(MemtoReg),
                              .ALUSrc(ALUSrc),
                              .RegWrite(RegWrite)
 
                             // .date1(date1),
                              //date2(date2),
                            //  .signextend_result(signextend_result),
                              //.pcaddr1(pcaddr1)
                              .result(result)
                              );
    */
    single_cycle single_cycle(reset, clk);
    
    
    initial
      begin
          $dumpfile("single_cycle.vcd");
          $dumpvars(0,test);
      end
endmodule // test

                
