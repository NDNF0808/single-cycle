`timescale 1ps/1ps
module alu(input [31:0] date1, date2, signextend_result,
           input [2:0]       controlline,
           input ALUSrc,
           output             zero,
           output reg [31:0] aluresult
           );
    reg  [31:0]               alusource1, alusource2;
    always @ (*)
      begin
          alusource1 = date1;
          alusource2 = (ALUSrc)? signextend_result : date2;
      end
    
               
    always @ (*)
      begin
          #150
          
          case (controlline)
            3'b000:    aluresult = alusource1 & alusource2;
            3'b001:  aluresult = alusource1 | alusource2;
            3'b010:   aluresult = alusource1 + alusource2;
            3'b110:  aluresult = alusource1 - alusource2;
            3'b111:  aluresult = (alusource1 < alusource2)? 1:0;
            default:  aluresult = 'd0;
               
          endcase // case (controlline)
            //  #100 zero = (alusource2 == alusource1)? 1:0;
              
             
      end // always @ (*)
    assign #100 zero = (alusource1 == alusource2)? 1:0;
endmodule // alu

            