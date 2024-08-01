----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:26 06/30/2024 
-- Design Name: 
-- Module Name:    DeMux1_4 - Behavioral 
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

entity DeMux1_4 is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Input : in  STD_LOGIC;
           Output1 : out  STD_LOGIC;
           Output2 : out  STD_LOGIC;
           Output3 : out  STD_LOGIC;
           Output4 : out  STD_LOGIC);
end DeMux1_4;

architecture Behavioral of DeMux1_4 is

begin
Output1 <= Input when sel = "00" else "0";
Output2 <= Input when sel = "01" else "0"; 
Output3 <= Input when sel = "10" else "0";
Output4 <= Input when sel = "11" else "0"; 

end Behavioral;

