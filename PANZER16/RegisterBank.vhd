----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:21:06 06/02/2024 
-- Design Name: 
-- Module Name:    RegisterBank - Behavioral 
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

entity RegisterBank is
    Port ( Clk : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end RegisterBank;

architecture Behavioral of RegisterBank is
component Register_16Bit
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  Sel : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR(15 downto 0);
        dout: out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;
component DeMux1_8 is
    Port ( Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Outputs : out  STD_LOGIC_VECTOR (7 downto 0);
           Input : in  STD_LOGIC);
end component;
component Mux16_8 is
    Port ( Sel : in  STD_LOGIC_VECTOR(2 downto 0);
           Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input3   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input4   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input5   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input6   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input7   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input8   : in  STD_LOGIC_VECTOR (15 downto 0);
           Output  : out STD_LOGIC_VECTOR (15 downto 0)
			  );
end component;
signal SelectSignals : STD_LOGIC_VECTOR(7 downto 0);
type registerarray is array (7 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal RegisterOutputs : registerarray;
begin
Dmux: DeMux1_8 port map (Sel, SelectSignals, Enable);
Mux: Mux16_8 port map (Sel, RegisterOutputs(0), RegisterOutputs(1), RegisterOutputs(2), RegisterOutputs(3), RegisterOutputs(4), RegisterOutputs(5), RegisterOutputs(6), RegisterOutputs(7),DataOut);

gen_label: for J in 0 to 7 generate
      R : Register_16Bit port map (Clk,RST, SelectSignals(J),DataIn, RegisterOutputs(J));
end generate gen_label;

end Behavioral;

