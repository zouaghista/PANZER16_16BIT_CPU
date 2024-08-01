----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:52:17 06/02/2024 
-- Design Name: 
-- Module Name:    DeMux16_2 - Behavioral 
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

entity DeMux16_2 is
    Port ( sel : in  STD_LOGIC;
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Output2 : out  STD_LOGIC_VECTOR (15 downto 0));
end DeMux16_2;

architecture Behavioral of DeMux16_2 is
begin
Output1 <= Input when sel = '0' else "0000000000000000";
Output2 <= Input when sel = '1' else "0000000000000000"; 
end Behavioral;

