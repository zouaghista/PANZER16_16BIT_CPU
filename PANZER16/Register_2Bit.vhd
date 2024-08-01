----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:25 06/03/2024 
-- Design Name: 
-- Module Name:    Register_2Bit - Behavioral 
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

entity Register_2Bit is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (1 downto 0);
           dout : out  STD_LOGIC_VECTOR (1 downto 0));
end Register_2Bit;

architecture Behavioral of Register_2Bit is
signal reg : STD_LOGIC_VECTOR(1 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            dout <= (others => '0');
        elsif rising_edge(clk) then
				if Sel = '1' then
					dout <= din;
				end if;
        end if;
    end process;
end Behavioral;

