----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:48 06/29/2024 
-- Design Name: 
-- Module Name:    Comparer2Bit - Behavioral 
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

entity Comparer2Bit is 
	 Port ( Input1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Greater : out  STD_LOGIC);
end Comparer2Bit;

architecture Behavioral of Comparer2Bit is

begin
Greater <= '1' when Input1 >  Input2 else '0';
end Behavioral;

