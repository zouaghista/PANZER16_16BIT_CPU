----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:38 06/02/2024 
-- Design Name: 
-- Module Name:    ComparisonUnit - Behavioral 
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

entity ComparisonUnit is
    Port ( Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Equal : out  STD_LOGIC;
           Greater : out  STD_LOGIC);
end ComparisonUnit;

architecture Behavioral of ComparisonUnit is

begin
Equal <= '1' when Input1 = Input2 else '0';
Greater <= '1' when Input1 >  Input2 else '0';
end Behavioral;

