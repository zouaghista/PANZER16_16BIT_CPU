----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:28 03/18/2024 
-- Design Name: 
-- Module Name:    Mux16-2 - MuxArch 
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

entity Mux16_2 is
    Port ( SEL : in  STD_LOGIC;
           Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
           Output  : out STD_LOGIC_VECTOR (15 downto 0));
end Mux16_2;

architecture MuxArch of Mux16_2 is
 
begin
Output <= Input1 when (SEL)='0' 
         else Input2 when (SEL)='1';
end MuxArch;

