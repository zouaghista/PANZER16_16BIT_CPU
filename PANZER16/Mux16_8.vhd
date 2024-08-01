----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:58:07 06/02/2024 
-- Design Name: 
-- Module Name:    Mux16_8 - Behavioral 
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

entity Mux16_8 is
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
end Mux16_8;

architecture Behavioral of Mux16_8 is

begin
Output <= Input1 when unsigned(SEL)= 0
         else Input2 when unsigned(SEL)= 1
			else Input3 when unsigned(SEL)= 2
			else Input4 when unsigned(SEL)= 3
			else Input5 when unsigned(SEL)= 4
			else Input6 when unsigned(SEL)= 5
			else Input7 when unsigned(SEL)= 6
			else Input8 when unsigned(SEL)= 7;
end Behavioral;

