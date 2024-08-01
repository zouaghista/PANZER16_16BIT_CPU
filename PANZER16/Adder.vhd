----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:46 06/02/2024 
-- Design Name: 
-- Module Name:    AdderSubtractor - Behavioral 
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

entity AdderSubtractor is
    Port ( Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Carry, operation : in  STD_LOGIC;
			  CarryOut: out STD_LOGIC;
           OutPut : out  STD_LOGIC_VECTOR (15 downto 0));
end AdderSubtractor;
architecture Behavioral of AdderSubtractor is
SIGNAL result_temp : unsigned(16 DOWNTO 0);
begin
result_temp <= (('0' & unsigned(Input1)) + ('0' & unsigned(Input2))) WHEN (operation = '0' and Carry = '0')
				 ELSE (('0' & unsigned(Input1)) + ('0' & unsigned(Input2)) + 1) WHEN (operation = '0' and Carry = '1')
				 ELSE (('0' & unsigned(Input1)) - ('0' & unsigned(Input2)));
    CarryOut    <= result_temp(16);
    OutPut      <= std_logic_vector(result_temp(15 downto 0));
end Behavioral;

