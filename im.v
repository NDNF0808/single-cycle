`timescale 1ps/1ps
module im(input [31:0] pcvalue,
          output reg [5:0]  opcode, funct,
          output reg [4:0]  rs, rt, rd, shamt,
          output reg [15:0] immediate,
          output  reg [25:0] addr26
          );
    reg [31:0]              iram [2**16 -1:0];
    initial
      begin
          $readmemh("imem.txt", iram,0 ,13);
      end
 always @ (*)
      begin
          opcode = iram[pcvalue][31:26];
          funct = iram[pcvalue][5:0];
          rs = iram[pcvalue][25:21];
          rt = iram[pcvalue][20:16];
          rd = iram[pcvalue][15:11];
          shamt = iram[pcvalue][10:6];
          immediate = iram[pcvalue][15:0];
          addr26 = iram[pcvalue][25:0];
          
      end
    endmodule
    
    