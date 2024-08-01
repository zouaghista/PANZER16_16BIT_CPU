----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:01:51 03/18/2024 
-- Design Name: 
-- Module Name:    Register_16Bit - RegisterArch 
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

entity Register_16Bit is
  Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  Sel : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR(15 downto 0);
        dout: out STD_LOGIC_VECTOR(15 downto 0)
    );
end Register_16Bit;

architecture RegisterArch of Register_16Bit is
    signal reg : STD_LOGIC_VECTOR(15 downto 0);
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
end RegisterArch;

