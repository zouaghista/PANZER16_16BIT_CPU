----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:36 06/02/2024 
-- Design Name: 
-- Module Name:    Mux16_4 - Behavioral 
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

entity Mux16_4 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Input4 : in  STD_LOGIC_VECTOR (15 downto 0);
           OutPut : out  STD_LOGIC_VECTOR (15 downto 0));
end Mux16_4;

architecture Behavioral of Mux16_4 is

begin
Output <= Input1 when (SEL)="00" 
         else Input2 when (SEL)="01"
         else Input3 when (SEL)="10"
         else Input4 when (SEL)="11";
end Behavioral;

