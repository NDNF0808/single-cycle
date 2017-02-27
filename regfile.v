`timescale 1ps/1ps
module regfile(input [4:0] rs, rt, rd,
               input         clk,
               input         RegDst, RegWrite, 
               input [31:0]  writedate,
               output   [31:0] date1, date2
               );
    //reg [31:0]               mem [2**5-1:0];
    
    wire            [4:0]         writereg;
    reg [31:0]               regf [2**5-1:0];
    
    assign  writereg = (RegDst)? rd : rt;
    initial
      begin
          $readmemh("regfile.txt", regf, 0, 31);
      end
    
 
    always @ (negedge  clk)//便于前半个周期写入后半个周期读出写入不需要延时
           if (RegWrite)
          regf[writereg] <= writedate;
    assign     #50 date1 =  (rs != 0)? regf [rs] : 0;
    assign    #50 date2 = (rt != 0)? regf[rt] : 0;
endmodule // regfile

    
        