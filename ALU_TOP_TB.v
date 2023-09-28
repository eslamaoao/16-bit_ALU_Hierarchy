`timescale 1us/1ps
module ALU_TOP_TB #(parameter Operand_SIZE = 16, parameter ALU_OUT = 32) ();
reg [Operand_SIZE-1 :0] A_TB;
reg [Operand_SIZE-1 :0] B_TB;
reg[3:0] ALU_FUN_TB;

reg CLK_TB;
reg RST_TB;

wire [ALU_OUT-1:0] SHIFT_OUT_TB;
wire  SHIFT_Flag_TB ;

wire [ALU_OUT-1:0] Arith_out_TB;
wire  Carry_OUT_TB;
wire  Arith_Flag_TB;

wire [ALU_OUT-1:0] Logic_OUT_TB;
wire  Logic_Flag_TB;

wire [ALU_OUT-1:0] CMP_OUT_TB;
wire  CMP_Flag_TB;

always 
begin
	#4 CLK_TB =1'B1;
	#6 CLK_TB =1'B0;
end


ALU_TOP DUT (
.A 				(A_TB),
.B     		 	(B_TB),
.ALU_FUN 		(ALU_FUN_TB),
.CLK 			(CLK_TB),
.RST 			(RST_TB),
.SHIFT_OUT 		(SHIFT_OUT_TB),
.SHIFT_Flag 	(SHIFT_Flag_TB),
.Arith_out 		(Arith_out_TB),
.Carry_OUT 		(Carry_OUT_TB),
.Arith_Flag 	(Arith_Flag_TB),
.Logic_OUT  	(Logic_OUT_TB),
.Logic_Flag 	(Logic_Flag_TB),
.CMP_OUT 		(CMP_OUT_TB),
.CMP_Flag 		(CMP_Flag_TB) 
);

initial 

	begin 
	A_TB       		 =8'd128; // A = 128 -- i will not change it's value later in the testbench
	B_TB       		 =8'd8;  // B = 8 --     i will not change it's value later in the testbench
	CLK_TB           =1'b0;
	ALU_FUN_TB  	 =4'b0000;
	RST_TB	  		 =1'b1;
	


	$display ("TEST ADDITION ");
	#10 

	if(Arith_out_TB =='d136)
		$display("test is passed");
	else
		$display("test is failed");
	 
	 
	 
	$display ("TEST SUBTRACTOR ");
	ALU_FUN_TB =4'b0001;
	#10

	if(Arith_out_TB =='d120)
		$display("test is passed");
	else
		$display("test is failed");




	$display ("TEST MUL ");
	ALU_FUN_TB =4'b0010;
	#10

	if(Arith_out_TB =='d1024)
		$display("test is passed");
	else
		$display("test is failed");




	$display ("TEST DIV ");
	ALU_FUN_TB =4'b0011;
	#10

	if(Arith_out_TB =='d16)
		$display("test is passed");
	else
		$display("test is failed");



	$display ("TEST AND ");
	ALU_FUN_TB =4'b0100;
	#10

	if(Logic_OUT_TB =='d0)
		$display("test is passed");
	else
		$display("test is failed");



	$display ("TEST OR ");
	ALU_FUN_TB =4'b0101;
	#10

	if(Logic_OUT_TB =='d136)
		$display("test is passed");
	else
		$display("test is failed");




	$display ("TEST NAND ");
	ALU_FUN_TB =4'b0110;
	#10

	if(Logic_OUT_TB =='d4294967295) // 0XFFFF FFFF
		$display("test is passed");
	else
		$display("test is failed");



	$display ("TEST NOR ");
	ALU_FUN_TB =4'b0111;
	#10

	if(Logic_OUT_TB =='d4294967159) // 0XFFFF FF77
		$display("test is passed");
	else
		$display("test is failed");



	$display ("TEST NOP ");
	ALU_FUN_TB =4'b1000;
	#10

	if(CMP_OUT_TB =='d0)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST CMP A = B ");
	ALU_FUN_TB =4'b1001;
	#10

	if(CMP_OUT_TB =='d0)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST CMP A > B ");
	ALU_FUN_TB =4'b1010;
	#10

	if(CMP_OUT_TB =='d2)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST CMP A < B ");
	ALU_FUN_TB =4'b1011;
	#10

	if(CMP_OUT_TB =='d0)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST SHIFT A RIGHT  ");
	ALU_FUN_TB =4'b1100;
	#10

	if(SHIFT_OUT_TB =='d64)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST SHIFT A LEFT  ");
	ALU_FUN_TB =4'b1101;
	#10

	if(SHIFT_OUT_TB =='d256)
		$display("test is passed");
	else
		$display("test is failed");
	
	

		$display ("TEST SHIFT B RIGHT  ");
	ALU_FUN_TB =4'b1110;
	#10

	if(SHIFT_OUT_TB =='d4)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST SHIFT B LEFT  ");
	ALU_FUN_TB =4'b1111;
	#10

	if(SHIFT_OUT_TB =='d16)
		$display("test is passed");
	else
		$display("test is failed");


	$display ("TEST RST  ");
	RST_TB = 1'b0;
	
	#20
	
	RST_TB = 1'b1;
	
	
	#500 
$stop;
	
	
	end


endmodule
