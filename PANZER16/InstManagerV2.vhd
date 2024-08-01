----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:59 06/29/2024 
-- Design Name: 
-- Module Name:    InstManagerV2 - Behavioral 
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

entity InstManagerV2 is
	Port ( RST : in  STD_LOGIC;
           Dequeue : in  STD_LOGIC;
           PReady : in  STD_LOGIC;
           Set : in  STD_LOGIC;
           ClkIn, ClkOut : in  STD_LOGIC;
           AdessIn : in  STD_LOGIC_VECTOR (15 downto 0);
           PDataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           Empty : out  STD_LOGIC;
           Busy : out  STD_LOGIC;
           Trans : out  STD_LOGIC;
           AdressOut : out  STD_LOGIC_VECTOR (15 downto 0);
           InstructionOut : out  STD_LOGIC_VECTOR (15 downto 0));
end InstManagerV2;

architecture Behavioral of InstManagerV2 is

component Register_16Bit
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  Sel : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR(15 downto 0);
        dout: out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;
component Incrementer
    Port ( CLk : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Register_2Bit is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (1 downto 0);
           dout : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
component Incrementer2Bit_WithCarry is
    Port ( Clk : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (1 downto 0);
           Carry : out  STD_LOGIC);
end component;
component Comparer2Bit is 
	 Port ( Input1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Greater : out  STD_LOGIC);
end component;
component Mux16_4 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input4 : in  STD_LOGIC_VECTOR (15 downto 0);
           OutPut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component DeMux1_4 is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Input : in  STD_LOGIC;
           Output1 : out  STD_LOGIC;
           Output2 : out  STD_LOGIC;
           Output3 : out  STD_LOGIC;
           Output4 : out  STD_LOGIC);
end component;
component Mux16_2 is
    Port ( SEL : in  STD_LOGIC;
           Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
           Output  : out STD_LOGIC_VECTOR (15 downto 0));
end component;
type RegOutArray is array(3 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
signal SelectInputRegister: STD_LOGIC_VECTOR(3 downto 0);
signal InPointerInput, InPointerOutput, OutPointerInput, OutPointerOutput: STD_LOGIC_VECTOR(1 downto 0); 
signal RegisterOutput: RegOutArray;
signal RegAdressInput, RegAdressOutput, AdressIncrementOut, RegAdeessTemp: STD_LOGIC_VECTOR (15 downto 0);
signal RegAdressSelect, RegAdressIncrement, RegInPointerSelect, RegOutPointerSelect : STD_LOGIC;
signal SelInPointerInc, SelOutPointerInc : STD_LOGIC;
signal InPointerIncOutput, OutPointerIncOutput : STD_LOGIC_VECTOR(1 downto 0); 
signal InPointerCarry, OutPointerCarry : STD_LOGIC;
signal InCarry, OutCarry, InIsGreater, full : STD_LOGIC;
signal EmptyFifo, SetRequest, ProcessRequest : STD_LOGIC;
signal EnableCachReg : STD_LOGIC;
begin
internalReg: for i IN 0 TO 3 GENERATE
	reg: Register_16Bit port map(ClkIn, RST, SelectInputRegister(i), PDataIn, RegisterOutput(i));
end GENERATE;
OutPutMux : Mux16_4 port map (OutPointerOutput, RegisterOutput(0),RegisterOutput(1),RegisterOutput(2),RegisterOutput(3), InstructionOut);
InputDeMux : DeMux1_4 port map(InPointerOutput, EnableCachReg, SelectInputRegister(0),SelectInputRegister(1),SelectInputRegister(2),SelectInputRegister(3));
AdressRegister: Register_16Bit port map(ClkIn, RST, RegAdressSelect , RegAdressInput, RegAdressOutput);
AdressIncrement: Incrementer port map(ClkIn, RegAdressIncrement, RegAdressOutput, AdressIncrementOut);
TempAdressRegister : Register_16Bit port map (ClkOut, RST, Set, AdessIn, RegAdeessTemp);
AdressRegInputMux : Mux16_2 port map (ProcessRequest, AdressIncrementOut,  RegAdeessTemp, RegAdressInput);
InPointer: Register_2Bit port map(ClkIn, RST, RegInPointerSelect, InPointerInput, InPointerOutput);
OutPointer : Register_2Bit port map(ClkOut, RST, RegOutPointerSelect, OutPointerInput, OutPointerOutput);
InPointerInc : Incrementer2Bit_WithCarry port map(ClkIn, SelInPointerInc, InPointerOutput, InPointerIncOutput, InPointerCarry);
OutPointerInc : Incrementer2Bit_WithCarry port map(ClkOut, SelOutPointerInc, OutPointerOutput, OutPointerIncOutput, OutPointerCarry);
Comp : Comparer2Bit port map(InPointerOutput, OutPointerOutput, InIsGreater);
EmptyFifo <= (not InIsGreater) or (InCarry xor OutCarry) or ProcessRequest or SetRequest;
busy <= EmptyFifo;
empty <= EmptyFifo;
AdressOut <= RegAdressOutput;
full <= (not InIsGreater) and (InCarry and OutCarry);
------------------------------------------------------------------
InInc: process(InPointerCarry, RST)
begin
	if (rst='1') then InCarry <= '0';
	elsif (InPointerCarry='1' and InPointerCarry'Event) then
		InCarry <= not InCarry;
	end if;
end process;
------------------------------------------------------------------
OutInc: process(OutPointerCarry, RST)
begin
	if (rst='1') then OutCarry <= '0';
	elsif (OutPointerCarry='1' and OutPointerCarry'Event) then
		OutCarry <= not OutCarry;
	end if;
end process;
------------------------------------------------------------------
InProcess: process(ClkIn, RST)
begin
	if (rst='1') then ProcessRequest <= '0';
							RegAdressSelect <= '0';
							RegAdressIncrement <= '1';
	elsif (ClkIn='1' and ClkIn'Event) then
		if(SetRequest = '1') then
			ProcessRequest <= '1';
			RegAdressSelect <= '1';
		end if;
		if(ProcessRequest = '1') then
			ProcessRequest <= '0';
			RegAdressSelect <= '0';
			RegAdressIncrement <= '1';
		end if;
		if (RegAdressIncrement = '1') then RegAdressIncrement <= '0';
		end if;
		
	end if;
end process;
------------------------------------------------------------------
outProcess: process(ClkOut, RST)
begin
	if (rst='1') then SelOutPointerInc <= '1';
							RegOutPointerSelect <= '0';
							SetRequest <= '0';
	elsif	(ClkOut = '1' and ClkOut'Event) then
		if(SelOutPointerInc = '1') then SelOutPointerInc  <= '0';
		end if;
		if (ProcessRequest = '1') then
			SetRequest <= '0';
		end if;
		if (set = '1') then SetRequest <= '1';
		elsif (Dequeue = '1') then
			if(EmptyFifo = '0') then
				SelOutPointerInc <= '1';
				RegOutPointerSelect <= '1';
			else
				RegOutPointerSelect <= '0';
			end if;
		else
			RegOutPointerSelect <= '0';
		end if;
	end if;
end process;
end Behavioral;

