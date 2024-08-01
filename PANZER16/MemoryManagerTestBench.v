`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:41:43 06/05/2024
// Design Name:   MemoryOutManager
// Module Name:   E:/CPU/RTL/PANZER16/MemoryManagerTestBench.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryOutManager
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryManagerTestBench;

	// Inputs
	reg Clk;
	reg Rst;
	reg Set;
	reg Enqueue;
	reg PReady;
	reg [15:0] AdressIn;
	reg [15:0] DataIn;

	// Outputs
	wire Empty;
	wire Busy;
	wire Trans;
	wire [15:0] DataOut;
	wire [15:0] AdressOut;

	// Instantiate the Unit Under Test (UUT)
	MemoryOutManager uut (
		.Clk(Clk), 
		.Rst(Rst), 
		.Set(Set), 
		.Enqueue(Enqueue), 
		.PReady(PReady), 
		.AdressIn(AdressIn), 
		.DataIn(DataIn), 
		.Empty(Empty), 
		.Busy(Busy), 
		.Trans(Trans), 
		.DataOut(DataOut), 
		.AdressOut(AdressOut)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst = 0;
		Set = 0;
		Enqueue = 0;
		PReady = 0;
		AdressIn = 0;
		DataIn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

