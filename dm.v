`timescale 1ps/1ps
module dm(input [31:0] aluresult, date2,
          input clk, MemWrite, MemtoReg , MemRead,
          output reg [31:0] readdate, result
          //   output [25:0] address
          );
    reg [31:0]              dram [2**16-1:0];
    initial
      begin
          $readmemh("dmem.txt", dram, 0,99  );
      end
    always @ (posedge clk)
      if (MemWrite)
      # 350  dram[aluresult] <= date2;
    always @ (*)
      begin
          if (MemRead)
        #350  readdate = dram[aluresult];
          result = (MemtoReg) ? readdate : aluresult;
      end
    
          
     
endmodule

 