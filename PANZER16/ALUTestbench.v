`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:36:05 06/03/2024
// Design Name:   ALU
// Module Name:   E:/CPU/RTL/PANZER16/ALUTestbench.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUTestbench;

	// Inputs
	reg OutputSel;
	reg [3:0] Instruction;
	reg CarryIn;
	reg [15:0] DataIn1;
	reg [15:0] DataIn2;

	// Outputs
	wire Done;
	wire Z;
	wire C;
	wire [15:0] DataOut;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.OutputSel(OutputSel), 
		.Instruction(Instruction), 
		.CarryIn(CarryIn), 
		.Done(Done), 
		.Z(Z), 
		.C(C), 
		.DataOut(DataOut), 
		.DataIn1(DataIn1), 
		.DataIn2(DataIn2)
	);
	
	reg[15:0] expectedResult;
	//reg[16:0] expectedResultWithCarry;
	reg[7:0] i;
	reg[7:0] SamplesPerTest = 200;
	reg expectedC;
	reg expectedZ;
	initial begin
		// Initialize Inputs
		OutputSel = 0;
		Instruction = 4'b1000; //Addition
		CarryIn = 0;
		DataIn1 = 0;
		DataIn2 = 0;
		expectedC = 0;
		i = 0;
		// Wait 100 ns for global reset to finish
		#100;
      
		//ADD TEST
		for(i = 0; i < SamplesPerTest; i = i+1)
		begin
		   Instruction = $random;
			DataIn1 = $random;
			DataIn2 = $random;
			//expectedC = DataIn1 > DataIn2;
			//expectedZ = DataIn1 == DataIn2;
			#15;
			if ((Z == 1||C == 1) && (!(Instruction == 4'b1000 ||Instruction == 4'b0010||Instruction == 4'b0001))) $display("ERROR: Mismatch at %d", i);
			
		end;
		$display("Addition Test sucess");
	end
      
endmodule

