----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:59 03/18/2024 
-- Design Name: 
-- Module Name:    Register_4Slot_Fifo - RegisterFifoArch 
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

entity Register_4Slot_Fifo is
  Port(
		DataIn : in STD_LOGIC_VECTOR (15 downto 0);
		DataOut : out STD_LOGIC_VECTOR (15 downto  0);
		Clk, Rst, Enqueue, Dequeue : in STD_LOGIC;
		Empty, Full : out STD_LOGIC
  );
end Register_4Slot_Fifo;

architecture RegisterFifoArch of Register_4Slot_Fifo is
  component MUX16_2 
    Port (
		  SEL : in  STD_LOGIC;
		  Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
		  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
		  Output  : out STD_LOGIC_VECTOR (15 downto 0)
    );
  end component;
  component Register_16Bit
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  Sel : in  STD_LOGIC;
        din : in  STD_LOGIC_VECTOR(15 downto 0);
        dout: out STD_LOGIC_VECTOR(15 downto 0)
    );
  end component;
  type test is array(2 downto 0) of std_logic_vector(15 downto 0);
  signal InterSignals: test;
  type muxcon is array(2 downto 0) of std_logic_vector(15 downto 0);
  signal RegSelect: std_logic_vector(3 downto 0):= "0000";
  signal MuxSelect : STD_LOGIC_VECTOR(2 downto 0):= "000";
  signal MuxOut: muxcon;
  signal DataCounter : unsigned(2 downto 0):= "000";
begin
  R1 : Register_16Bit port map(Clk, Rst,RegSelect(3), DataIn, InterSignals(2));
  Mux1 : MUX16_2 port map(MuxSelect(2), InterSignals(2), DataIn, MuxOut(2));
  R2 : Register_16Bit port map(Clk, Rst,RegSelect(2), MuxOut(2), InterSignals(1));
  Mux2 : MUX16_2 port map(MuxSelect(1), InterSignals(1), DataIn, MuxOut(1));
  R3 : Register_16Bit port map(Clk, Rst,RegSelect(1), MuxOut(1), InterSignals(0));
  Mux3 : MUX16_2 port map(MuxSelect(0), InterSignals(0), DataIn, MuxOut(0));
  R4 : Register_16bit port map(Clk, Rst,RegSelect(0), MuxOut(0), DataOut);
  
  Empty <= '1' when DataCounter = "000" else '0';
  Full <= '1' when DataCounter = "100" else '0';
  process(Clk, Rst)
  Begin
		if Rst = '1' then
			DataCounter <= (others => '0');
			RegSelect <= "0000";
		elsif rising_edge(Clk) then
			if (Dequeue = '1') then
			   MuxSelect <= "000";
				RegSelect <= "1111";
				if (DataCounter > 0) then
					DataCounter <= DataCounter - 1;
					--report "Decrising";
					end if;
			elsif (Enqueue = '1') then
				case DataCounter is
					when "000" => 
						RegSelect <= "0001";
						MuxSelect <= "001";
					when "001" =>
						RegSelect <= "0010";
						MuxSelect <= "010";
					when "010" =>
						RegSelect <= "0100";
						MuxSelect <= "100";
					when "011" =>
						RegSelect <= "1000";
					When others =>
						RegSelect <= "0000";
						MuxSelect <= "000";
				end case;
				if (DataCounter < 4) then
					DataCounter <= DataCounter + 1;
					--report "Encrising";
					end if;
			else 
				      RegSelect <= "0000";
						MuxSelect <= "000";
			end if;
      end if;
  end process;
end RegisterFifoArch;

