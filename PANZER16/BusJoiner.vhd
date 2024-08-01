----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:36:54 06/03/2024 
-- Design Name: 
-- Module Name:    BusJoiner - Behavioral 
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

entity BusJoiner is
    Port ( DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0);
           EnableWrite : in  STD_LOGIC;
           MainBus : inout  STD_LOGIC_VECTOR (15 downto 0));
end BusJoiner;

architecture Behavioral of BusJoiner is

begin
process(datain, EnableWrite, MainBus)
 begin
	  if EnableWrite = '1' then
			MainBus <= datain;
			dataout <= (others => 'Z');
	  else
			dataout <= MainBus;
			MainBus <= (others => 'Z');
	  end if;
end process;
end Behavioral;

