module ALU_TOP #(parameter Operand_SIZE = 16, parameter ALU_OUT = 32) 
(
input wire [Operand_SIZE-1 :0] A,
input wire [Operand_SIZE-1 :0] B,
input wire [3:0] ALU_FUN,

input wire CLK,
input wire RST,

output wire [ALU_OUT-1:0] SHIFT_OUT,
output wire  SHIFT_Flag, 

output wire [ALU_OUT-1:0] Arith_out,
output wire  Carry_OUT,
output wire  Arith_Flag,

output wire [ALU_OUT-1:0] Logic_OUT,
output wire  Logic_Flag, 


output wire [ALU_OUT-1:0] CMP_OUT,
output wire  CMP_Flag

);


wire Arith_Enable_wire;
wire Logic_Enable_wire;
wire SHIFT_Enable_wire;
wire CMP_Enable_wire  ;


Decoder U0 (
.ALU_FUN_decoder (ALU_FUN[3:2]),
.Arith_Enable    (Arith_Enable_wire),
.SHIFT_Enable    (SHIFT_Enable_wire),
.Logic_Enable    (Logic_Enable_wire),
.CMP_Enable      (CMP_Enable_wire) 
);



ARITHMETIC_UNIT U1 (
.A 				(A),
.B 				(B),
.ALU_FUN 		(ALU_FUN [1:0] ),
.CLK 			(CLK),
.RST            (RST),
.Arith_Enable   (Arith_Enable_wire),
.Arith_out 		(Arith_out),
.Carry_OUT 		(Carry_OUT),
.Arith_Flag 	(Arith_Flag)
);


LOGIC_UNIT U2 (
.A 				(A),
.B 				(B),
.ALU_FUN 		(ALU_FUN [1:0] ),
.CLK 			(CLK),
.RST            (RST),
.Logic_Enable   (Logic_Enable_wire),
.Logic_OUT 		(Logic_OUT),
.Logic_Flag 	(Logic_Flag)
);

SHIFT_UNIT U3 (
.A 				(A),
.B 				(B),
.ALU_FUN 		(ALU_FUN [1:0] ),
.CLK 			(CLK),
.RST            (RST),
.SHIFT_Enable   (SHIFT_Enable_wire),
.SHIFT_OUT 		(SHIFT_OUT),
.SHIFT_Flag 	(SHIFT_Flag)
);

CMP_UNIT U4 (
.A 				(A),
.B 				(B),
.ALU_FUN 		(ALU_FUN [1:0] ),
.CLK 			(CLK),
.RST            (RST),
.CMP_Enable     (CMP_Enable_wire),
.CMP_OUT 		(CMP_OUT),
.CMP_Flag 	    (CMP_Flag)
);
endmodule


