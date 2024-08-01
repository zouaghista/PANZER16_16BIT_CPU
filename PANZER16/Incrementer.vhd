----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:34 06/01/2024 
-- Design Name: 
-- Module Name:    Incrementer - Behavioral 
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

entity Incrementer is
    Port ( CLk : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end Incrementer;

architecture Behavioral of Incrementer is
signal dout : unsigned(15 downto 0):= "0000000000000000";
begin
DataOut <= std_logic_vector(dout);
process (Clk)
begin
	if(rising_edge(Clk)) then
		if(Sel = '1') then
			dout <= unsigned(DataIn) + 1;
		end if;
	end if;
end process;
end Behavioral;

