module Decoder (

input wire [1:0] ALU_FUN_decoder,

output reg Arith_Enable,
output reg Logic_Enable,
output reg CMP_Enable,
output reg SHIFT_Enable);

always@(*)
begin
case (ALU_FUN_decoder)
				
					2'b00:
							begin
							  Arith_Enable <=  1'b1 ;
							  Logic_Enable <=  1'b0 ;
							  CMP_Enable   <=  1'b0 ;
							  SHIFT_Enable <=  1'b0 ;
							  
							end
					2'b01:
							begin
							  Arith_Enable <=  1'b0 ;
							  Logic_Enable <=  1'b1 ;
							  CMP_Enable   <=  1'b0 ;
							  SHIFT_Enable <=  1'b0 ;
							end
					2'b10:
							begin
							  Arith_Enable <=  1'b0 ;
							  Logic_Enable <=  1'b0 ;
							  CMP_Enable   <=  1'b1 ;
							  SHIFT_Enable <=  1'b0 ;
							end
					2'b11:
							begin
							  Arith_Enable <=  1'b0 ;
							  Logic_Enable <=  1'b0 ;
							  CMP_Enable   <=  1'b0 ;
							  SHIFT_Enable <=  1'b1 ;
							end
					default: 
							begin
							  Arith_Enable <=  1'b1 ;
							  Logic_Enable <=  1'b0 ;
							  CMP_Enable   <=  1'b0 ;
							  SHIFT_Enable <=  1'b0 ;
							  
							end
					endcase



end
endmodule