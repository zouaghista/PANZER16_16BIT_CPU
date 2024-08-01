`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:21:33 03/18/2024
// Design Name:   Register_4Slot_Fifo
// Module Name:   E:/CPU/RTL/PANZER16/ShiftRegisterTest.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_4Slot_Fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ShiftRegisterTest;

	// Inputs
	reg [15:0] DataIn;
	reg Clk;
	reg Rst=0;
	reg Enqueue = 0;
	reg Dequeue = 0;

	// Outputs
	wire [15:0] DataOut;
	wire Empty;
	wire Full;
	
	reg [0:15] data[0:3];
	reg [0:7] i,j;
	reg [0:31] NumberOfTests;
	reg [0:15] OutPutData[0:3];
	reg fail;
	// Instantiate the Unit Under Test (UUT)
	Register_4Slot_Fifo uut (
		.DataIn(DataIn), 
		.DataOut(DataOut), 
		.Clk(Clk), 
		.Rst(Rst), 
		.Enqueue(Enqueue), 
		.Dequeue(Dequeue), 
		.Empty(Empty), 
		.Full(Full)
	);
	
	initial begin
   forever #25 Clk = ~Clk;
   end
	
	initial begin
		DataIn = 0;
		Clk = 0;
		Rst = 0;
		#25
		Enqueue = 0;
		Dequeue = 0;
		i = 0;
		Rst = 1;
		#50
		Rst = 0;
		#25
		NumberOfTests = 100;
		@(posedge Clk);
		for(i = 0; i < NumberOfTests; i = i + 1) begin
		   //Generate sample
			for(j=0; j < 4; j =j+1) begin
		      data[j] = $random(i+j);
			end
			//register samples
			for(j=0; j < 4; j = j+1) begin
				DataIn = data[j];
				Enqueue = 1;
				@(posedge Clk);
			end
			Enqueue = 0;
			//gather Outputs
			@(posedge Clk);
			@(posedge Clk);
			for(j=0;j<4;j = j+1) begin
				OutPutData[j] = DataIn;
				Dequeue = 1;
				@(posedge Clk);

			end
			Dequeue = 0;
			//comapre
			fail = 0;
			for (j=0;j<4;j=1+j) begin
				if(data[j]==OutPutData[j]) fail = 1;
			end
			if(fail)
				$display("Test %d out of %d succedded", i+1, NumberOfTests);
			else
				$display("Test %d out of %d FAILED", i+1, NumberOfTests);
		end
		end
      
endmodule

