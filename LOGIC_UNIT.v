
module LOGIC_UNIT  #(parameter Operand_SIZE = 16, parameter ALU_OUT = 32) (

input wire [Operand_SIZE-1 :0] A,
input wire [Operand_SIZE-1 :0] B,
input wire [1:0] ALU_FUN,

input wire CLK,
input wire Logic_Enable,
input wire RST,

output reg [ALU_OUT-1:0] Logic_OUT,
output wire  Logic_Flag );

always@(posedge CLK or negedge RST)
  begin
	if ( !RST )
	  begin
		  Logic_OUT <= 'd0;
		end
	else
	  begin
	    if(Logic_Enable)
			  begin
				case (ALU_FUN)
				
					2'b00:
							begin
							  Logic_OUT <=  A&B ;
							end
					2'b01:
							begin
							  Logic_OUT <=  A|B ;
							end
					2'b10:
							begin
							  Logic_OUT <=  ~(A&B) ;
							end
					2'b11:
							begin
							  Logic_OUT <=  ~(A|B) ;
							end
					default: 
							begin
							  Logic_OUT <=  A&B ;
							end
					endcase
				end
		else
		 begin
			Logic_OUT <='d0;
		 end			
	        end
   end
   assign Logic_Flag = (Logic_Enable == 1'b1);
  endmodule