----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:37 06/29/2024 
-- Design Name: 
-- Module Name:    Incrementer2Bit_WithCarry - Behavioral 
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

entity Incrementer2Bit_WithCarry is
    Port ( Clk : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (1 downto 0);
           Carry : out  STD_LOGIC);
end Incrementer2Bit_WithCarry;
architecture Behavioral of Incrementer2Bit_WithCarry is
signal dout : unsigned(2 downto 0):= "000";
begin
DataOut <= std_logic_vector(dout(1 downto 0));
Carry <= dout(2);
process (Clk)
begin
	if(rising_edge(Clk)) then
		if(Sel = '1') then
			dout <= unsigned('0'& dataIn) + 1;
		end if;
	end if;
end process;
end Behavioral;

