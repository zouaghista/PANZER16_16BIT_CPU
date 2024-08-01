----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:27 06/02/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port (
           OutputSel : in  STD_LOGIC;
           Instruction : in  STD_LOGIC_VECTOR (3 downto 0);
           CarryIn : in  STD_LOGIC;
           Done, Z, C : out  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0);
           DataIn1 : in  STD_LOGIC_VECTOR (15 downto 0);
           DataIn2 : in  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is
component Multiplier is
    Port ( InPut1 : in  STD_LOGIC_VECTOR (15 downto 0);
           InPut2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component AdderSubtractor is
    Port ( Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Carry, operation : in  STD_LOGIC;
			  CarryOut: out STD_LOGIC;
           OutPut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component LogicAlgebraModule is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           OutPut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component ComparisonUnit is
    Port ( Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Equal : out  STD_LOGIC;
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
component Mux16_2 is
    Port ( SEL : in  STD_LOGIC;
           Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
           Output  : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal MultiOut : STD_LOGIC_VECTOR (31 downto 0);
signal Greater, Carryout: STD_LOGIC;
signal LogicOut, AdderOut, DataOut1 : STD_LOGIC_VECTOR (15 downto 0);
signal MuxSel : STD_LOGIC_VECTOR (1 downto 0);
signal Cout, Zout: STD_LOGIC;
begin
Multi: Multiplier port map(DataIn1, DataIn2, MultiOut);
AddSub: AdderSubtractor port map(DataIn1, DataIn2, CarryIn, Instruction(1) ,Carryout, AdderOut);
LogicUnit: LogicAlgebraModule port map(Instruction(1 downto 0) ,DataIn1, DataIn2, LogicOut);
CmpUnit : ComparisonUnit port map (DataIn1, DataIn2, Zout, Greater);
outputMux : Mux16_4 port map(MuxSel, DataIn1, AdderOut, MultiOut(15 downto 0), LogicOut, DataOut1);
outputSecondMux : Mux16_2 port map (OutputSel, DataOut1, MultiOut(31 downto 16), DataOut);
MuxSel <= "00" when Instruction = "0000"
			else "01" when Instruction(3 downto 2) = "00" and Instruction(0) /= Instruction(1)
			else "10" when Instruction(3 downto 2) = "00"
			else "11";
Cout <= Greater when Instruction(3) = '1'
	  else CarryOut;
C <= Cout and (not Instruction(2)) and (((Instruction(0) xor Instruction(1)) and (not Instruction(3)))
					or (Instruction(3) and (not Instruction(1)) and (not Instruction(0))));
Z <= Zout and Instruction(3) and (not Instruction(2)) and (not Instruction(1)) and (not Instruction(0));
end Behavioral;

