`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:54:23 06/03/2024
// Design Name:   InstManager
// Module Name:   E:/CPU/RTL/PANZER16/InstructionManagerTestBench.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstManager
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionManagerTestBench;

	// Inputs
	reg RST;
	reg Dequeue;
	wire PReady;
	reg Set;
	reg Clk;
	reg [15:0] AdessIn;
	wire [15:0] PDataIn;

	// Outputs
	wire Empty;
	wire Busy;
	wire Trans;
	wire [15:0] AdressOut;
	wire [15:0] InstructionOut;
	reg [15:0] IPWRitePLACEHOLDER;

	// Instantiate the Unit Under Test (UUT)
	InstManager uut (
		.RST(RST), 
		.Dequeue(Dequeue), 
		.PReady(PReady), 
		.Set(Set), 
		.Clk(Clk), 
		.AdessIn(AdessIn), 
		.PDataIn(PDataIn), 
		.Empty(Empty), 
		.Busy(Busy), 
		.Trans(Trans), 
		.AdressOut(AdressOut), 
		.InstructionOut(InstructionOut)
	);
	reg InstRead = 0;
	AHBTestModule ROMSide(
		.Clk(Clk),
		.Trans(Trans),
		.AdressBus(AdressOut),
		.ReadWrite(InstRead),
		.MasterReadBus(PDataIn),
		.Ready(PReady),
		.MasterWriteBus(IPWRitePLACEHOLDER)
	);	

	initial begin
		  Clk = 0;  // Initialize clock to 0
		  forever #10 Clk = ~Clk;  // Toggle clock every 5 time units (10ns period, 100MHz clock)
	end
	reg[15:0] i;
	initial begin
		// Initialize Inputs
		RST = 1;
		Dequeue = 0;
		Set = 0;
		Clk = 0;
		AdessIn = 0;

		#150;
		RST = 0;
		// Wait 100 ns for global reset to finish
		for(i = 0; i <1024; i=i+1)
			ROMSide.WriteMemory(i,$random);
		// Wait 100 ns for global reset to finish
		Set = 1;
		AdessIn = 69;
		@(posedge Clk);
		Set = 0;
		#100;
		Set = 1;
		AdessIn = 68;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		Set = 0;
		#100;
		#100;
		#100;
		AdessIn = 0;
      @(posedge Clk);
		@(posedge Clk);
      @(posedge Clk);
		Dequeue = 1;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		Dequeue = 0;
		// Add stimulus here

	end
      
endmodule

