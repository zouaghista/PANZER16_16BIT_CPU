----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:59 06/02/2024 
-- Design Name: 
-- Module Name:    LogicAlgebraModule - Behavioral 
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

entity LogicAlgebraModule is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           OutPut : out  STD_LOGIC_VECTOR (15 downto 0));
end LogicAlgebraModule;

architecture Behavioral of LogicAlgebraModule is

begin
OutPut <= not Input1 When SEL = "10"
			 else Input1 and Input2 when SEL = "01"
			 else Input1 or Input2 when SEL = "00"
			 else Input1 Xor Input2 when SEL = "11";
end Behavioral;

