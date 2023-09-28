
module CMP_UNIT  #(parameter Operand_SIZE = 16, parameter ALU_OUT = 32) (

input wire [Operand_SIZE-1 :0] A,
input wire [Operand_SIZE-1 :0] B,
input wire [1:0] ALU_FUN,

input wire CLK,
input wire CMP_Enable,
input wire RST,

output reg [ALU_OUT-1:0] CMP_OUT,
output wire  CMP_Flag );

always@(posedge CLK or negedge RST)
  begin
	if ( !RST )
	  begin
		  CMP_OUT <= 'd0;
		end
	else
	  begin
	    if(CMP_Enable)
			  begin
				case (ALU_FUN)
				
					2'b00:
							begin
							  CMP_OUT <= 'd0 ; //nop
							end
					2'b01:
							begin
							  if (A==B)
								 begin
									  CMP_OUT ='d1;
								 end
							 else
								 begin
									  CMP_OUT ='d0;
								 end
							end
					2'b10:
							begin
							  if (A>B)
								begin
									 CMP_OUT ='d2;
								end
							  else
								begin
									 CMP_OUT ='d0;
								end
							end
					2'b11:
							begin
							   if (A<B)
								 begin
									 CMP_OUT ='d3;
								 end
							   else
								 begin
									 CMP_OUT ='d0;
								 end
							end
					default: 
							begin
							   CMP_OUT <= 'd0 ; //nop
							end
					endcase
				end
		else
		 begin
			CMP_OUT <='d0;
		 end			
	        end
   end
   assign CMP_Flag = (CMP_Enable == 1'b1);
  endmodule