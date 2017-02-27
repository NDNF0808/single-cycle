`timescale 1ps/1ps
`include "./pc.v"
`include "./im.v"
`include "./bigcontrol.v"
`include "./regfile.v"
`include "./signextend.v"
`include "./pcadder.v"
`include "./alu.v"
`include "./littlecontrol.v"
`include "./dm.v"
`include "./branchadder.v"
module single_cycle(input reset, clk
                    //input [31:0] branchaddr, writedate,
/*                    output   [1:0] ALUOP,
                    output       RegDst, Branch1,MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite
  
                    output [31:0] date1, date2,
                    output [31:0] signextend_result,
  */
               //   output [31:0] pcaddr1,
                 // output [31:0] aluresult
                   // output    [31:0]   result
                    );
    wire [31:0]                 pc_value, date_1, date_2, signextend_result1,branch_addr, pc_addr, alu_result, read_date, resu_lt, jump_addr;
    
    wire [5:0]                   op_code,f_unct;
    wire [4:0]                   r_s, r_t, r_d, sh_amt;
    wire [15:0]                  imm_ediate;
    wire [1:0]                   ALU_OP;
    wire                  ju_mp,   ze_ro,    Reg_Dst, Branch_1, Mem_Read, Memto_Reg, Mem_Write, ALU_Src, Reg_Write;
    wire [2:0]                         control_line;
    wire [25:0]                        addr_26;
    
    
    
    
    
    pcadder pcadder(pc_value, addr_26, pc_addr, jump_addr);
    
    
    pc pc(.pcaddr(pc_addr),
          .jumpaddr(jump_addr),
          .jump(ju_mp),
          .branchaddr(branch_addr),
          .clk(clk),
          .reset(reset),
          .pcvalue(pc_value),
          .zero(ze_ro),
          .branch1(branch_1)          );
    im im(.pcvalue(pc_value),
          .opcode(op_code),
          .funct(f_unct),
          .rs(r_s),
          .rt(r_t),
          .rd(r_d),
          .shamt(sh_amt),
          .immediate(imm_ediate),
          .addr26(addr_26)
          );
    bigcontrol bigcontrol(.opcode(op_code),
                          .ALUOP(ALU_OP),
                          .RegDst(Reg_Dst),
                          .Branch1(branch_1),
                          .MemRead(Mem_Read),
                          .MemtoReg(Memto_Reg),
                          .MemWrite(Mem_Write),
                          .ALUSrc(ALU_Src),
                          .RegWrite(Reg_Write),
                          .jump(ju_mp));
    regfile regfile (.rs(r_s),
                 .rt(r_t),
                 .rd(r_d),
                 .clk(clk),
                 .RegDst(Reg_Dst),
                 .RegWrite(Reg_Write),
                 .writedate(resu_lt),
                 .date1(date_1),
                 .date2(date_2));
    signextend signextend(.immediate(imm_ediate),
                          .signextend_result(signextend_result1)
                          );
    littlecontrol littlecontrol(ALU_OP,f_unct, control_line);
    
    alu alu(date_1, date_2, signextend_result1,control_line,ALU_Src,ze_ro, alu_result);
    dm dm(alu_result, date_2, clk, Mem_Write, Memto_Reg, Mem_Read,  read_date, resu_lt);
    branchadder branchadder(signextend_result1, pc_addr, branch_addr);
    
    
  endmodule
 