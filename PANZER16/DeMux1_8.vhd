----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:15:01 06/02/2024 
-- Design Name: 
-- Module Name:    DeMux1_8 - Behavioral 
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

entity DeMux1_8 is
    Port ( Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Outputs : out  STD_LOGIC_VECTOR (7 downto 0);
           Input : in  STD_LOGIC);
end DeMux1_8;

architecture Behavioral of DeMux1_8 is

begin
gen_label: for J in 0 to 7 generate
      Outputs(J) <= Input when to_integer(unsigned(SEL)) = J else '0';
end generate gen_label;

end Behavioral;

