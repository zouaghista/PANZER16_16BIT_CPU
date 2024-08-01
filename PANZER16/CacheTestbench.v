`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:39:40 06/03/2024
// Design Name:   Cache
// Module Name:   E:/CPU/RTL/PANZER16/CacheTestbench.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Cache
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CacheTestbench;

	// Inputs
	reg Clk;
	reg Rst;
	reg [1:0] Sel;
	wire IPReady;
	wire DPReady;
	reg [15:0] AdressBus;
	reg SetInstAdress;
	reg SetDataAdress;
	wire [15:0] IPReadBus;
	wire [15:0] DPReadBus;
	reg [15:0] DataInBus;
	reg [15:0] IPWRitePLACEHOLDER;
	reg EnqueueData;
	reg DequeueData;
	reg DequeueInstruction;

	// Outputs
	wire [15:0] InstructionBus;
	wire [15:0] InstAdress;
	wire [15:0] DataAdress;
	wire [15:0] DPWriteBus;
	wire InstructionBusy;
	wire InstructionEmpty;
	wire ITrans;
	wire DTrans;
	wire DataBusy;
	wire [15:0] DataOutBus;
	wire DPReadWrite;
	
	// Instantiate the Unit Under Test (UUT)
	Cache uut (
		.Clk(Clk), 
		.Rst(Rst), 
		.Sel(Sel), 
		.IPReady(IPReady), 
		.DPReady(DPReady), 
		.InstructionBus(InstructionBus), 
		.AdressBus(AdressBus), 
		.InstAdress(InstAdress), 
		.DataAdress(DataAdress), 
		.SetInstAdress(SetInstAdress), 
		.SetDataAdress(SetDataAdress), 
		.IPReadBus(IPReadBus), 
		.DPReadBus(DPReadBus), 
		.DPWriteBus(DPWriteBus), 
		.InstructionBusy(InstructionBusy), 
		.InstructionEmpty(InstructionEmpty), 
		.ITrans(ITrans), 
		.DTrans(DTrans), 
		.DataBusy(DataBusy), 
		.DataInBus(DataInBus), 
		.DataOutBus(DataOutBus), 
		.EnqueueData(EnqueueData), 
		.DequeueData(DequeueData), 
		.DequeueInstruction(DequeueInstruction),
		.DPReadWrite(DPReadWrite)
	);
	
	reg InstRead = 0;
	AHBTestModule ROMSide(
		.Clk(Clk),
		.Trans(ITrans),
		.AdressBus(InstAdress),
		.ReadWrite(InstRead),
		.MasterReadBus(IPReadBus),
		.Ready(IPReady),
		.MasterWriteBus(IPWRitePLACEHOLDER)
	);	
	AHBTestModule RAMSide(
		.Clk(Clk),
		.Trans(DTrans),
		.AdressBus(DataAdress),
		.ReadWrite(DPReadWrite),
		.MasterReadBus(DPReadBus),
		.Ready(DPReady),
		.MasterWriteBus(DPWriteBus)
	);
	
	initial begin
        Clk = 0;  // Initialize clock to 0
        forever #10 Clk = ~Clk;  // Toggle clock every 5 time units (10ns period, 100MHz clock)
   end
	reg[15:0] i;
	reg[16:0] intermid;
	initial begin
		// Initialize Inputs
		Clk = 0;
		Sel = 0;
		AdressBus = 0;
		SetInstAdress = 0;
		SetDataAdress = 0;
		EnqueueData = 0;
		DequeueData = 0;
		DequeueInstruction = 0;
		intermid = 0;
		for(i = 0; i <1024; i=i+1) begin
		   $display("Writing data to fake ROM/RAM");
			ROMSide.WriteMemory(i,$random);
			RAMSide.WriteMemory(i, intermid);
		end
		Rst = 1;
		#100;
		Rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
		#100;
		#100;
      @(posedge Clk);
		DequeueInstruction = 1;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		DequeueInstruction = 0;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		DataInBus = 1;
		@(posedge Clk);
		EnqueueData = 1;
		@(posedge Clk);
		@(posedge Clk);
		DataInBus = 2;
		@(posedge Clk);
		DataInBus = 3;
		@(posedge Clk);
		DataInBus = 4;
		@(posedge Clk);
		EnqueueData = 0;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		for(i = 0; i < 4; i =i+1)begin
			RAMSide.ReadMemory(i, intermid);
			$display("VAL %d  FOUND AT  %d", intermid, i);
		end
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		// Add stimulus here
		AdressBus = 0;
		Sel = 1;
		SetDataAdress = 1;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		SetDataAdress = 0;
		@(posedge Clk);
		@(posedge Clk);		
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);		
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);		
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);		
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);		
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		DequeueData = 1;
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		@(posedge Clk);
		DequeueData = 0;
	end
	
      
endmodule

