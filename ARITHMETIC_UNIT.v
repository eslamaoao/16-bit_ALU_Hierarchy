module ARITHMETIC_UNIT #(parameter Operand_SIZE = 16, parameter ALU_OUT = 32) 
(
input wire [Operand_SIZE-1 :0] A,
input wire [Operand_SIZE-1 :0] B,
input wire [1:0] ALU_FUN,

input wire CLK,
input wire Arith_Enable,
input wire RST,

output reg [ALU_OUT-1:0] Arith_out,
output reg  Carry_OUT,
output wire  Arith_Flag );






always@(posedge CLK or negedge RST)
  begin
	if ( !RST )
	  begin
		  Arith_out <= 'd0;
		end
	else
	  begin
	    if(Arith_Enable)
			  begin
				case (ALU_FUN)
				
					2'b00:
							begin
							  {Carry_OUT,Arith_out} <=  A+B ;
							end
					2'b01:
							begin
							  {Carry_OUT,Arith_out} <= A-B;
							end
					2'b10:
							begin
							  {Carry_OUT,Arith_out} <= A*B;
							end
					2'b11:
							begin
							  {Carry_OUT,Arith_out} <= A/B;
							end
					default: 
							begin
							  {Carry_OUT,Arith_out} <=  A+B ;
							end
					endcase
				end
		else
		 begin
			Arith_out <='d0;
		 end			
	        end
   end
   assign Arith_Flag = (Arith_Enable == 1'b1);
  endmodule

