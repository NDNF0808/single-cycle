`timescale 1ps/1ps
module branchadder(input [31:0] signextend, pcaddr,
                   output [31:0] branchaddr);
    assign branchaddr = pcaddr + (signextend<<2);
endmodule // branchadder
