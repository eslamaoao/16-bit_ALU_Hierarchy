module SHIFT_UNIT #(parameter Operand_SIZE = 16, parameter ALU_OUT = 32) (

input wire [Operand_SIZE-1 :0] A,
input wire [Operand_SIZE-1 :0] B,
input wire [1:0] ALU_FUN,

input wire CLK,
input wire SHIFT_Enable,
input wire RST,

output reg [ALU_OUT-1:0] SHIFT_OUT,
output wire  SHIFT_Flag );

always@(posedge CLK or negedge RST)
  begin
	if ( !RST )
	  begin
		  SHIFT_OUT <= 'd0;
		end
	else
	  begin
	    if(SHIFT_Enable)
			  begin
				case (ALU_FUN)
				
					2'b00:
							begin
							  SHIFT_OUT <=   A>>1 ;
							end
					2'b01:
							begin
							  SHIFT_OUT <=   A<<1;
							end
					2'b10:
							begin
							  SHIFT_OUT <=   B>>1 ;
							end
					2'b11:
							begin
							  SHIFT_OUT <=   B<<1 ;
							end
					default: 
							begin
							  SHIFT_OUT <=   A>>1 ;
							end
					endcase
				end
		else
		 begin
			SHIFT_OUT <='d0;
		 end			
	        end
   end
   assign SHIFT_Flag = (SHIFT_Enable == 1'b1);
  endmodule
