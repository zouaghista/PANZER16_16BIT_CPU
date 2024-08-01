----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:06 06/03/2024 
-- Design Name: 
-- Module Name:    Mux3_3 - Behavioral 
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

entity Mux3_3 is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Input1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Input3 : in  STD_LOGIC_VECTOR (2 downto 0);
           OutPut : out  STD_LOGIC_VECTOR (2 downto 0));
end Mux3_3;

architecture Behavioral of Mux3_3 is

begin
Output <= Input1 when (SEL)="00" 
         else Input2 when (SEL)="01"
         else Input3 when (SEL)="10";
end Behavioral;

