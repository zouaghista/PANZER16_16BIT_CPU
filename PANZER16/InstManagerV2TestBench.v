`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:40:13 07/03/2024
// Design Name:   InstManagerV2
// Module Name:   E:/CPU/RTL/PANZER16/InstManagerV2TestBench.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstManagerV2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstManagerV2TestBench;

	// Inputs
	reg RST;
	reg Dequeue;
	reg PReady;
	reg Set;
	reg ClkIn;
	reg ClkOut;
	reg [15:0] AdessIn;
	reg [15:0] PDataIn;
	reg [15:0] IPWRitePLACEHOLDER;
	reg RWPlaceHolder = 0;

	// Outputs
	wire Empty;
	wire Busy;
	wire Trans;
	wire [15:0] AdressOut;
	wire [15:0] InstructionOut;

	// Instantiate the Unit Under Test (UUT)
	InstManagerV2 uut (
		.RST(RST), 
		.Dequeue(Dequeue), 
		.PReady(PReady), 
		.Set(Set), 
		.ClkIn(ClkIn), 
		.ClkOut(ClkOut), 
		.AdessIn(AdessIn), 
		.PDataIn(PDataIn), 
		.Empty(Empty), 
		.Busy(Busy), 
		.Trans(Trans), 
		.AdressOut(AdressOut), 
		.InstructionOut(InstructionOut)
	);
	
	AHBTestModule ROMSide(
		.Clk(ClkIn),
		.Trans(Trans),
		.AdressBus(AdressOut),
		.ReadWrite(RWPlaceHolder),
		.MasterReadBus(PDataIn),
		.Ready(PReady),
		.MasterWriteBus(IPWRitePLACEHOLDER)
	);
	
	initial begin
        ClkIn = 0;
        forever #15 ClkIn = ~ClkIn;
   end
	initial begin
        ClkOut = 0;
        forever #10 ClkOut = ~ClkOut;
   end
	initial begin
		// Initialize Inputs
		RST = 1;
		Dequeue = 0;
		PReady = 0;
		Set = 0;
		AdessIn = 25;
		PDataIn = 0;

		// Wait 100 ns for global reset to finish
		#100;
      RST = 0;
		@(posedge ClkOut);
		Set = 1;
		@(posedge ClkOut);
		Set = 0;
		AdessIn = 0;
		
	end
      
endmodule

