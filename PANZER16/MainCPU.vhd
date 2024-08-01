----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:54:03 06/03/2024 
-- Design Name: 
-- Module Name:    MainCPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainCPU is
    Port ( Clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           IPReady : in  STD_LOGIC;
           DPReady : in  STD_LOGIC;
           DPReadBus : in  STD_LOGIC_VECTOR (15 downto 0);
           IPReadBus : in  STD_LOGIC_VECTOR (15 downto 0);
           IPTrans : out  STD_LOGIC;
           DPTrans : out  STD_LOGIC;
           DPReadWrite : out  STD_LOGIC;
           IPAdressBus : out  STD_LOGIC_VECTOR (15 downto 0);
           DPAdressBus : out  STD_LOGIC_VECTOR (15 downto 0);
           DPWriteBus : out  STD_LOGIC_VECTOR (15 downto 0));
end MainCPU;

architecture Behavioral of MainCPU is
component DeMux16_2 is
    Port ( sel : in  STD_LOGIC;
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Output2 : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component BusJoiner is
    Port ( DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0);
           EnableWrite : in  STD_LOGIC;
           MainBus : inout  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Register_16Bit is
  Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  Sel : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR(15 downto 0);
        dout: out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;
component Mux16_2 is
    Port ( SEL : in  STD_LOGIC;
           Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
           Output  : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component RegisterBank is
    Port ( Clk : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Cache is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           IPReady : in  STD_LOGIC;
           DPReady : in  STD_LOGIC;
           InstructionBus : out  STD_LOGIC_VECTOR (15 downto 0);
           AdressBus : in  STD_LOGIC_VECTOR (15 downto 0);
			  InstAdress : out  STD_LOGIC_VECTOR (15 downto 0);
			  DataAdress : out  STD_LOGIC_VECTOR (15 downto 0);
			  SetInstAdress : in  STD_LOGIC;
			  SetDataAdress : in  STD_LOGIC;
           IPReadBus : in  STD_LOGIC_VECTOR (15 downto 0);
           DPReadBus : in  STD_LOGIC_VECTOR (15 downto 0);
           DPWriteBus : out  STD_LOGIC_VECTOR (15 downto 0);
           InstructionBusy : out  STD_LOGIC;
			  InstructionEmpty : out  STD_LOGIC;
			  ITrans, DTrans : out  STD_LOGIC;
           DataBusy : out  STD_LOGIC;
           DataInBus : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOutBus : out  STD_LOGIC_VECTOR (15 downto 0);
           EnqueueData : in  STD_LOGIC;
           DequeueData : in  STD_LOGIC;
           DequeueInstruction : in  STD_LOGIC;
			  DPReadWrite : out STD_LOGIC);
end component;
component ALU is
    Port (
           OutputSel : in  STD_LOGIC;
           Instruction : in  STD_LOGIC_VECTOR (3 downto 0);
           CarryIn : in  STD_LOGIC;
           Done, Z, C : out  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0);
           DataIn1 : in  STD_LOGIC_VECTOR (15 downto 0);
           DataIn2 : in  STD_LOGIC_VECTOR (15 downto 0));
end component;
component ControlUnit is
    Port ( Clk, RST : STD_LOGIC;
			  InstructionBus : in  STD_LOGIC_VECTOR (15 downto 0);
           AdressBus : out  STD_LOGIC_VECTOR (15 downto 0);
           DataBus : out  STD_LOGIC_VECTOR (15 downto 0);
			  ExecutionState : in STD_LOGIC_VECTOR (1 downto 0);
			  --ALU Signals
			  ALUInstruction : out STD_LOGIC_VECTOR (3 downto 0);
			  ALUOutputSel, ALUCarryIn : out STD_LOGIC;
			  ALUDone : in STD_LOGIC;  
			  ALUInSelect, ALUOutSelect, ALUEnableWrite, ALUBuffer1Select, ALUBuffer2Select: out STD_LOGIC;
			  --Cach Signals
			  CachSelect : out STD_LOGIC_VECTOR (1 downto 0);
			  CachSetInstAdress, CachSetDataAdress: out STD_LOGIC;
			  CachInstructionBusy, CachInstructionEmpty, CachDataBusy : in STD_LOGIC;
			  CachEnqueueData, CachDequeueData, CachDequeueInstruction, CachEnableWrite, CachAdressSourceSelect : out STD_LOGIC;
			  --RegisterBank Signals
			  RegisterBankEnable, RegisterBankEnableWrite : out STD_LOGIC;
			  RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);
			  --Path Signals
			  ConstantOut : out STD_LOGIC
			  );			  
end component;
--Shared Signals
signal MainBus, AdressBus : STD_LOGIC_VECTOR (15 downto 0);
--ALU Signals
signal ALUIn1, ALUIn2, ALUOut : STD_LOGIC_VECTOR (15 downto 0);
signal ALUGlobalIn : STD_LOGIC_VECTOR (15 downto 0);
signal ALUInstruction : STD_LOGIC_VECTOR (3 downto 0);
signal ALUZ, ALUC, ALUCarryIn, ALUOutputSel, ALUDone : STD_LOGIC;  
signal ALUInSelect, ALUOutSelect, ALUEnableWrite, ALUBuffer1Select, ALUBuffer2Select: STD_LOGIC;
--RegisterBank Signals
signal RegisterBankDataIn, RegisterBankDataOut : STD_LOGIC_VECTOR (15 downto 0);
signal RegisterBankSelect : STD_LOGIC_VECTOR (2 downto 0);
signal RegisterBankEnable, RegisterBankEnableWrite: STD_LOGIC;
--Cach Signals
signal CachInstructionBus, CachAdressBus, CachDataInBus, CachDataOutBus, CachControlAdressBus  : STD_LOGIC_VECTOR (15 downto 0);
signal CachSelect : STD_LOGIC_VECTOR (1 downto 0);
signal CachSetInstAdress, CachSetDataAdress, CachInstructionBusy, CachInstructionEmpty, CachDataBusy : STD_LOGIC;
signal CachEnqueueData, CachDequeueData, CachDequeueInstruction, CachEnableWrite, CachAdressSourceSelect : STD_LOGIC;
--ControlUnit Signals
signal ConstantOut : STD_LOGIC;
signal ExecutionState : STD_LOGIC_VECTOR (1 downto 0);
signal ControlUnitInBus, ControlUnitOutBus : STD_LOGIC_VECTOR (15 downto 0);
begin
--ALU Path
ALUInBuffer1 : Register_16Bit port map(clk, rst, ALUBuffer1Select, ALUGlobalIn, ALUIn1);
ALUInBuffer2 : Register_16Bit port map(clk, rst, ALUBuffer2Select, ALUGlobalIn, ALUIn2);
ALUBusJoiner : BusJoiner port map (ALUOut, ALUGlobalIn, ALUEnableWrite, MainBus);
ALUnit: ALU port map (ALUOutputSel, ALUInstruction, ALUCarryIn ,ALUDone, ALUZ, ALUC, ALUOut, ALUIn1, ALUIn2);
ExecutionState(0) <= ALUZ;
ExecutionState(1) <= ALUC;
--RegisterBank Path
RegBankBusJoiner : BusJoiner port map (RegisterBankDataOut, RegisterBankDataIn, RegisterBankEnableWrite, MainBus);
RegBank : RegisterBank port map (Clk, Rst, RegisterBankEnable, RegisterBankSelect ,RegisterBankDataIn, RegisterBankDataOut );
--Cache Path
CacheBusJoiner : BusJoiner port map (CachDataOutBus, CachDataInBus, CachEnableWrite, MainBus);
CachAdressMux : Mux16_2 port map(CachAdressSourceSelect, CachControlAdressBus, MainBus, CachAdressBus);
CachUnit : Cache port map (Clk, RST, CachSelect, IPReady, DPReady, CachInstructionBus, CachAdressBus,
									IPAdressBus, DPAdressBus, CachSetInstAdress, CachSetDataAdress, IPReadBus,
									DPReadBus, DPWriteBus, CachInstructionBusy, CachInstructionEmpty, IPTrans, 
									DPTrans, CachDataBusy, CachDataInBus, CachDataOutBus, CachEnqueueData, CachDequeueData,
									CachDequeueInstruction, DPReadWrite);
--ControlUnit Path
CU: ControlUnit Port map ( Clk, RST,
			  CachInstructionBus,
           CachControlAdressBus,
           ControlUnitOutBus,
			  ExecutionState,
			  --ALU Signals
			  ALUInstruction,
			  ALUOutputSel, ALUCarryIn,
			  ALUDone  ,
			  ALUInSelect, ALUOutSelect, ALUEnableWrite, ALUBuffer1Select, ALUBuffer2Select,
			  --Cach Signals
			  CachSelect,
			  CachSetInstAdress, CachSetDataAdress,
			  CachInstructionBusy, CachInstructionEmpty, CachDataBusy,
			  CachEnqueueData, CachDequeueData, CachDequeueInstruction, CachEnableWrite, CachAdressSourceSelect,
			  --RegisterBank Signals
			  RegisterBankEnable, RegisterBankEnableWrite,
			  RegisterBankSelect,
			  --Path Signals
			  ConstantOut
			  );
ControlUnitBusJoiner : BusJoiner port map (ControlUnitOutBus, ControlUnitInBus, ConstantOut, MainBus);
end Behavioral;

