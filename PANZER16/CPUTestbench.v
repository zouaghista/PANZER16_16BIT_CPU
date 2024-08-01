`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06/06/2024
// Design Name:   MainCPU
// Module Name:   E:/CPU/RTL/PANZER16/CPUTestbench.v
// Project Name:  PANZER16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MainCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPUTestbench;

	// Inputs
	reg Clk;
	reg RST;
	wire IPReady;
	wire DPReady;
	reg [15:0] IPWRitePLACEHOLDER;
	wire [15:0] DPReadBus;
	wire [15:0] IPReadBus;

	// Outputs
	wire IPTrans;
	wire DPTrans;
	wire DPReadWrite;
	wire [15:0] IPAdressBus;
	wire [15:0] DPAdressBus;
	wire [15:0] DPWriteBus;

	// Instantiate the Unit Under Test (UUT)
	MainCPU uut (
		.Clk(Clk), 
		.RST(RST), 
		.IPReady(IPReady), 
		.DPReady(DPReady), 
		.DPReadBus(DPReadBus), 
		.IPReadBus(IPReadBus), 
		.IPTrans(IPTrans), 
		.DPTrans(DPTrans), 
		.DPReadWrite(DPReadWrite), 
		.IPAdressBus(IPAdressBus), 
		.DPAdressBus(DPAdressBus), 
		.DPWriteBus(DPWriteBus)
	);
	
	reg InstRead = 0;
	AHBTestModule ROMSide(
		.Clk(Clk),
		.Trans(IPTrans),
		.AdressBus(IPAdressBus),
		.ReadWrite(InstRead),
		.MasterReadBus(IPReadBus),
		.Ready(IPReady),
		.MasterWriteBus(IPWRitePLACEHOLDER)
	);	
	AHBTestModule RAMSide(
		.Clk(Clk),
		.Trans(DPTrans),
		.AdressBus(DPAdressBus),
		.ReadWrite(DPReadWrite),
		.MasterReadBus(DPReadBus),
		.Ready(DPReady),
		.MasterWriteBus(DPWriteBus)
	);
	initial begin
        Clk = 0;
        forever #10 Clk = ~Clk;
   end
	
	reg [15:0] intern;
	reg[9:0] ConsoleAdress = 1023;
	
   always @(posedge Clk) begin
		RAMSide.ReadMemory(ConsoleAdress, intern);
		if(intern != 0) begin
			$write("%c", intern);
			//$display("Current Simulation Time: %0t", $time);
			RAMSide.WriteMemory(ConsoleAdress, 0);
		end
	end
	//Console Simulation
	reg [15:0] x=0;
	reg [15:0] i;
	initial begin
		// Initialize Inputs
		Clk = 0;
		x = 0;
		RST = 1;
		for(i = 0; i <1023; i=i+1) begin
			ROMSide.WriteMemory(i, x);
			RAMSide.WriteMemory(i, x);
		end
		RAMSide.WriteMemory(0, 104); //h
		RAMSide.WriteMemory(1, 101); //e
		RAMSide.WriteMemory(2, 108); //l
		RAMSide.WriteMemory(3, 108); //l
		RAMSide.WriteMemory(4, 111); //o
		RAMSide.WriteMemory(5, 68);//32); // " "
		RAMSide.WriteMemory(6, 108); //l
		RAMSide.WriteMemory(7, 101); //e
		RAMSide.WriteMemory(8, 111); //o
		RAMSide.WriteMemory(9, 108); //l
		RAMSide.WriteMemory(10, 108); //l
		AddInstruction(16'b0000000001000000);
AddInstruction(16'b0000000001101100);
AddInstruction(16'b0000110001000000);
AddInstruction(16'b0000000000000000);
AddInstruction(16'b0000010110000000);
AddInstruction(16'b0001110001000000);
AddInstruction(16'b0000000000001011);
AddInstruction(16'b0001010001000000);
AddInstruction(16'b0000000000000001);
AddInstruction(16'b0001100001000000);
AddInstruction(16'b0000000000010000);
AddInstruction(16'b0000100010001010);
AddInstruction(16'b0010011010000001);
AddInstruction(16'b0000100000001000);
AddInstruction(16'b0000001100011111);
AddInstruction(16'b0000001110001011);
AddInstruction(16'b0110110001000001);
AddInstruction(16'b0000000000000001);
AddInstruction(16'b0000001110001011);


		#100;
		RST = 0;
	end
   
	
	
	reg [15:0] adres = 0;
	task AddInstruction;
		 input [15:0] data;
		 begin
			ROMSide.WriteMemory(adres, data);
			adres = adres + 1;
		 end
	endtask
endmodule

