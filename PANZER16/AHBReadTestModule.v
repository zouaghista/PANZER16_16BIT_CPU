`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:28 06/05/2024 
// Design Name: 
// Module Name:    AHBTestModule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module AHBTestModule(
    input Clk,
    input Trans,
    input [15:0] AdressBus,
    input ReadWrite,
    output reg [15:0] MasterReadBus,
	 output reg Ready,
    input [15:0] MasterWriteBus
    );
	reg [0:15] Simulated_MEM[0:1023];
	reg [0:15] adress;
	reg gotadress;
	
	initial begin
		Ready = 0;
		MasterReadBus = 0;
	end;
	
	always @(posedge Clk) begin
		Ready = 0;
		if(Trans) begin
			if(!gotadress) begin
				adress = AdressBus;
				gotadress = 1;
				@(posedge Clk);
			end
		end
		if(Trans) begin
			Ready = 1;
			if(!ReadWrite) begin
				MasterReadBus = Simulated_MEM[adress];
				adress = AdressBus;
			end
			else begin
			   Simulated_MEM[adress] = MasterWriteBus;
				adress = AdressBus;
			end
		end
		else begin
			gotadress = 0;
			end
	end
	task WriteMemory;
		 input [9:0] mem_address;
		 input [16:0] data;
		 begin
			  Simulated_MEM[mem_address]=data;
		 end
	endtask
	task ReadMemory;
    input [9:0] mem_address;
    output [15:0] mem_data;
    begin
        mem_data = Simulated_MEM[mem_address];
    end
	endtask
endmodule
