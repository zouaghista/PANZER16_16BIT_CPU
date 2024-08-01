----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:08:33 06/02/2024 
-- Design Name: 
-- Module Name:    MemoryOutManager - Behavioral 
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

entity MemoryOutManager is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Set : in  STD_LOGIC;
           Enqueue : in  STD_LOGIC;
           PReady : in  STD_LOGIC;
           AdressIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           Empty : out  STD_LOGIC;
           Busy : out  STD_LOGIC;
           Trans : out STD_LOGIC;
           DataOut : out STD_LOGIC_VECTOR (15 downto 0);
           AdressOut : out  STD_LOGIC_VECTOR (15 downto 0));
end MemoryOutManager;

architecture Behavioral of MemoryOutManager is
component   Register_4Slot_Fifo
	Port(
		DataIn : in STD_LOGIC_VECTOR (15 downto 0);
		DataOut : out STD_LOGIC_VECTOR (15 downto  0);
		Clk, Rst, Enqueue, Dequeue : in STD_LOGIC;
		Empty, Full : out STD_LOGIC
  );
end component;
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
component Incrementer
    Port ( CLk : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
Type InstState is(Idle, Fetching, Waiting, Enqueueing, Dequeueing, Setting);
signal CurrentState : InstState;
signal Control : STD_LOGIC_VECTOR (7 downto 0);
signal IsEmpty, IsFull, FifoRST : STD_LOGIC;
signal IncOutPut, AdressMuxOutput, RegAdressOutPut : STD_LOGIC_VECTOR (15 downto 0);
begin
Reg_Inc : Incrementer port map (Clk, Control(5), RegAdressOutPut, IncOutPut);
Reg_Mux : MUX16_2 port map(Control(4), IncOutPut, AdressIn, AdressMuxOutput);
Reg_Adress : Register_16Bit port map (Clk, RST, Control(6), AdressMuxOutput, RegAdressOutPut);
InternalFifo : Register_4Slot_Fifo port map (DataIn, DataOut, Clk, FifoRST, Control(2), Control(3), IsEmpty, IsFull);
Empty <= IsEmpty;
Busy <= Control(0);
Trans <= Control(7);
AdressOut <= RegAdressOutPut;
FifoRST <= '1' when (((Control(1)) = '1') or RST = '1') else '0';


states_process:process(clk,rst)
begin
	if (rst='1') then CurrentState <= Idle;
	elsif (clk='1' and clk'Event) then
		case CurrentState is
			when idle => if (Set='1') then CurrentState <= Setting;
							 elsif (Enqueue = '1') then CurrentState <= Enqueueing;
							 end if;
			when Waiting => if (PReady = '1') then CurrentState <= Dequeueing;
								 end if;
			when Fetching => if IsEmpty = '1' then CurrentState <= Idle;
								  elsif (PReady = '1') then CurrentState <= Dequeueing;
								  else CurrentState <= Waiting;
								  end if;
			when Enqueueing => if (Enqueue='0') then CurrentState <= Fetching;
									 end if;
			when Dequeueing => if IsEmpty = '1' then CurrentState <= Idle;
									 else CurrentState <= Fetching;
									 end if;
			when Setting => if(Enqueue = '1') then CurrentState <= Enqueueing;
			 					 elsif (Set='0') then CurrentState <= Idle;
								 end if;
			When others => CurrentState <= Idle;
	    end case;
	end if;			
end process;

control_process:process(CurrentState)
begin
	case CurrentState is
		when idle => Control <= "00000000";
		when Fetching => Control <= "10100001";
		when Waiting => Control <= "10000001";
		when Enqueueing => Control <= "00000101";
		when Dequeueing => Control <= "01001001";
		when Setting => Control <= "01010010";
		when others => Control <= "00000000";
	end case;
end process;
end Behavioral;

