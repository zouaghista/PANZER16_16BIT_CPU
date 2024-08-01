----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:49:07 06/03/2024 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
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
			  CachSelect :out STD_LOGIC_VECTOR (1 downto 0);
			  CachSetInstAdress, CachSetDataAdress: out STD_LOGIC;
			  CachInstructionBusy, CachInstructionEmpty, CachDataBusy : in STD_LOGIC;
			  CachEnqueueData, CachDequeueData, CachDequeueInstruction, CachEnableWrite, CachAdressSourceSelect : out STD_LOGIC;
			  --RegisterBank Signals
			  RegisterBankEnable, RegisterBankEnableWrite : out STD_LOGIC;
			  RegisterSelect : out STD_LOGIC_VECTOR (2 downto 0);
			  --Path Signals
			  ConstantOut : out STD_LOGIC
			  );			  
end ControlUnit;

architecture Behavioral of ControlUnit is
component Register_16Bit is
  Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  Sel : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR(15 downto 0);
        dout: out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;
component Register_2Bit is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (1 downto 0);
           dout : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
component Mux3_3 is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Input3 : in  STD_LOGIC_VECTOR (2 downto 0);
           OutPut : out  STD_LOGIC_VECTOR (2 downto 0));
end component;
--Path Signals
signal Instruction1Buffer, Instruction2Buffer : STD_LOGIC_VECTOR (15 downto 0);
signal SelInstR1, SelInstR2, SelInstRegisters, SelectStateR : STD_LOGIC;
signal RegisterBankSelectM : STD_LOGIC_VECTOR (1 downto 0);
signal CPUStateBus : STD_LOGIC_VECTOR (1 downto 0);
signal ALUBufferSelect: STD_Logic;
--CPU States
type ProcessorState is (StartFetch, Fetch, SetupData, Execute, CleanUp);
signal CPUState: ProcessorState;
type InstructionType is (None, ALUInst, CacheInst, JUMPInst);
signal CurrentInstType : InstructionType;
--intermidiate signals
signal InstructionBufferSwitch : STD_LOGIC;
signal SetUpPass : unsigned( 1 downto 0);
signal hasConstant, CachSetInstAdressSignal, CachSetInstEnable :STD_LOGIC;
signal busystart : STD_LOGIC;
signal DequeuSignal, DequeuTimer:STD_LOGIC;
begin
--data paths
InstructionRegister1 : Register_16Bit port map(Clk, RST, SelInstR1, InstructionBus, Instruction1Buffer);
InstructionRegister2 : Register_16Bit port map(Clk, RST, SelInstR2, InstructionBus, Instruction2Buffer);
StateRegister : Register_2Bit port map(Clk, RST, SelectStateR, ExecutionState, CPUStateBus);
RegisterBankSelectMux : Mux3_3 port map(RegisterBankSelectM, Instruction1Buffer(9 downto 7), Instruction1Buffer(12 downto 10),
										  Instruction1Buffer(15 downto 13), RegisterSelect);
ALUInstruction <= Instruction1Buffer(3 downto 0);
SelInstR1 <= (not InstructionBufferSwitch) and SelInstRegisters;
SelInstR2 <= InstructionBufferSwitch and SelInstRegisters;
DataBus <= Instruction2Buffer;
CachSetInstAdress <= CachSetInstAdressSignal and CachSetInstEnable;
CachDequeueInstruction <= DequeuSignal and (not busystart or CachInstructionBusy or DequeuTimer);
process(Clk, RST)
variable WillUpdate, StoreORLoad: std_logic;
variable instCurrentType: InstructionType;
begin
	if ( rst = '1')then 
		CPUState <= StartFetch;
		CurrentInstType <= None;
		instCurrentType := None;
		StoreORLoad := '0';
		DequeuSignal <= '0';
		InstructionBufferSwitch <= '0';
		ALUEnableWrite <= '0';
		RegisterBankEnableWrite <= '0';
		hasConstant <= '0';
		SelectStateR <= '0';
		SetUpPass <= "00";
		CachEnableWrite <= '0';
		ALUBuffer1Select <= '0';
		busystart <= '0';
		CachSetInstAdressSignal <= '0';
		CachSetInstEnable <= '0';
		ALUBuffer2Select <= '0';
		ALUOutputSel <= '0';
		ConstantOut <= '0';
		RegisterBankSelectM <= "00";
		SelInstRegisters <= '0';
		DequeuTimer <= '0';
		ALUCarryIn <= '0';
		elsif (clk='1' and clk'Event) then
		if (DequeuTimer = '1') then DequeuTimer <= '0';
		end if;
		case CPUState is
		when StartFetch =>
			if (DequeuSignal <= '0') then DequeuTimer <= '1'; end if;
		   DequeuSignal <= '1';
			if (CachInstructionBusy = '0' and CachInstructionEmpty = '0') then
				SelInstRegisters <= '1';
				CPUState <= Fetch;
				if(hasConstant = '0') then
					if(InstructionBus(6) = '1') then
						CachSetInstEnable <= '0';
					else
						CachSetInstEnable <= '1';
					end if;
					if (InstructionBus(3 downto 0) ="1001") then  CachSelect <= "00";
																 CachAdressSourceSelect <= '1';
																 CachSetDataAdress <= '1'; 
																 StoreORLoad := '1';
					elsif (InstructionBus(3 downto 0) ="1010") then  CachSelect <= "11";
																 CachAdressSourceSelect <= '1';
																 CachSetDataAdress <= '1';
																 StoreORLoad := '0';
					elsif (InstructionBus(3 downto 0) ="1011") then
																 CachSetInstAdressSignal <= '1';
																 DequeuSignal <= '0';
																 CachAdressSourceSelect <= '1';
					elsif (InstructionBus(3 downto 0) ="1111") then
																 CachSetInstAdressSignal <= (InstructionBus(4) and CPUStateBus(0))
																							 or (InstructionBus(5) and CPUStateBus(1));
																 CachAdressSourceSelect <= '1';
																 DequeuSignal <= not ((InstructionBus(4) and CPUStateBus(0))
																							 or (InstructionBus(5) and CPUStateBus(1)));
					end if;
				else
					CachSetInstEnable <= '1';
				end if;
			else
				busystart <= '1';
			end if;
		when Fetch => SelInstRegisters <= '0';
			  DequeuSignal <= '0';
			  DequeuTimer <= '0';
			  busystart <= '0';
			if(hasConstant = '1') then
						InstructionBufferSwitch <= '0';
						SelInstRegisters <= '0';
						ConstantOut <= '1';
						WillUpdate := '1';
						CPUState <= SetupData;
			else 
				if (InstructionBus(3) = '0' or InstructionBus(3 downto 0) ="1000") then
					CurrentInstType <= ALUInst;
					instCurrentType := ALUInst;
				elsif (InstructionBus(3 downto 0) ="1001" or InstructionBus(3 downto 0) ="1010") then
					CurrentInstType <= CacheInst;
					instCurrentType := CacheInst;
				else
					CurrentInstType <= JUMPInst;
					instCurrentType := JUMPInst;
				end if;
				if(InstructionBus(6) = '1') then
				      hasConstant <= '1';
						InstructionBufferSwitch <= '1';
						CPUState <= StartFetch;
				  else
						SelInstRegisters <= '0';
						RegisterBankSelectM <= "00";
						RegisterBankEnableWrite <= '1';
						WillUpdate := '1';
					   CPUState <= SetupData;
				  end if;
			end if;
			if (WillUpdate = '1') then
				WillUpdate := '0';
				if (instCurrentType = ALUInst) then
					ALUBuffer1Select <= '1';
				elsif (instCurrentType = CacheInst) then
					CachSetDataAdress <= '0';					
					if(StoreORLoad = '1') then
						CachEnqueueData <= '1';
					else
						if((hasConstant = '1' and Instruction1Buffer(7) = '1') or (hasConstant = '0' and InstructionBus(7) = '1')) then
							CachDequeueData <= '0';
						else
							CachDequeueData <= '1';
						end if;
					end if;
			   else
					CachSetInstAdressSignal <= '0';
				end if;
			end if;
		when SetupData => case SetUpPass is
			--first pass
			when "00" =>
				if (CurrentInstType = ALUInst) then
					ConstantOut <= '0';
					if(Instruction1Buffer(3 downto 0) ="1000" or Instruction1Buffer(3 downto 0) ="0010" or Instruction1Buffer(3 downto 0) ="0001")then
						SelectStateR <= '1';
					end if;
					if(Instruction1Buffer(3 downto 0) ="0000") then CPUState <= Execute;
																					ALUEnableWrite <= '1';
																					ConstantOut <= '0';
																					RegisterBankEnableWrite <= '0';
																					ALUBuffer1Select <= '0';
					else ALUBuffer1Select <= '0';
						  ALUBuffer2Select <= '1';
						  RegisterBankSelectM <= "01";
						  RegisterBankEnableWrite <= '1';
						  SetUpPass <= SetUpPass + 1;
					end if;
				elsif (CurrentInstType = CacheInst) then
					ConstantOut <= '0';
					CachSetDataAdress <= '0';
					if(StoreORLoad = '1') then
						RegisterBankSelectM <= "01";
						RegisterBankEnableWrite <= '1';
						CachEnqueueData <= '0';
						CPUState <= Execute;
					else
						CPUState <= Execute;
					end if;
				else
					CPUState <= Execute;
				end if;
			--second pass
			when "01" => if (CurrentInstType = ALUInst) then
						  ALUBuffer2Select <= '0';
						  ALUEnableWrite <= '1';
						  RegisterBankEnableWrite <= '0';
						  CPUState <= Execute;
					  else
						  RegisterBankEnableWrite <= '1';
						  CPUState <= Execute;
					  end if;
			--third pass
			when "10" =>
			--fourth pass
			when "11" =>
			when others => -- do nothing
		end case;
		when Execute => SetUpPass <= "00";
		if (CurrentInstType = ALUInst) then
			if(Instruction1Buffer(3 downto 0) ="0000") then RegisterBankSelectM <= "01";
																	 else RegisterBankSelectM <= "10";
																	 end if;
			if (not(Instruction1Buffer(3 downto 0) = "1000")) then
				RegisterBankEnable <= '1';
				RegisterBankEnableWrite <= '0';
			end if;
			CPUState <= CleanUp;
		elsif (CurrentInstType = CacheInst) then
				if(StoreORLoad = '1') then
				if (cachdatabusy = '0') then
					CPUState <= CleanUp;
				end if;
				elsif (cachdatabusy = '0' and SetUpPass = "11") then CPUState <= CleanUp;
														  RegisterBankEnableWrite <= '0';
														  RegisterBankSelectM <= "01";
														  SetUpPass <= "00";
														  RegisterBankEnable <= '1';
														  CachEnableWrite <= '1';
														  CachDequeueData <= '0';
				end if;
				SetUpPass <= "11";
		else  CPUState <= CleanUp;
		end if;
		when CleanUp => RegisterBankEnable <= '0';
							 RegisterBankEnableWrite <= '0';
							 CachEnableWrite <= '0';
							 hasConstant <= '0';
							 constantout <= '0';
							 ALUEnableWrite <= '0';
							 CPUState <= StartFetch;
							 CachSetInstEnable <= '0';
							 SetUpPass <= "00";
							 SelectStateR <= '0';
	end case;
	end if;
end process;
end Behavioral;