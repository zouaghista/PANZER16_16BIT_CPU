----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:39:00 06/02/2024 
-- Design Name: 
-- Module Name:    Cache - Behavioral 
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

entity Cache is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           IPReady : in  STD_LOGIC;
           DPReady : in  STD_LOGIC;
           InstructionBus : out  STD_LOGIC_VECTOR (15 downto 0);
           AdressBus : in  STD_LOGIC_VECTOR (15 downto 0);
			  InstAdress : out  STD_LOGIC_VECTOR (15 downto 0);
			  DataAdress : out  STD_LOGIC_VECTOR (15 downto 0);
			  SetInstAdress : in  STD_LOGIC;
			  SetDataAdress : in  STD_LOGIC;
           IPReadBus : in  STD_LOGIC_VECTOR (15 downto 0);
           DPReadBus : in  STD_LOGIC_VECTOR (15 downto 0);
           DPWriteBus : out  STD_LOGIC_VECTOR (15 downto 0);
           InstructionBusy : out  STD_LOGIC;
			  InstructionEmpty : out  STD_LOGIC;
			  ITrans, DTrans : out  STD_LOGIC;
           DataBusy : out  STD_LOGIC;
           DataInBus : in  STD_LOGIC_VECTOR (15 downto 0);
           DataOutBus : out  STD_LOGIC_VECTOR (15 downto 0);
           EnqueueData : in  STD_LOGIC;
           DequeueData : in  STD_LOGIC;
           DequeueInstruction : in  STD_LOGIC;
			  DPReadWrite : out STD_LOGIC);
end Cache;

architecture Behavioral of Cache is
component MemoryOutManager is
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
end component;
component InstManager is
  Port ( RST : in  STD_LOGIC;
           Dequeue : in  STD_LOGIC;
           PReady : in  STD_LOGIC;
           Set : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           AdessIn : in  STD_LOGIC_VECTOR (15 downto 0);
           PDataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           Empty : out  STD_LOGIC;
           Busy : out  STD_LOGIC;
           Trans : out  STD_LOGIC;
           AdressOut : out  STD_LOGIC_VECTOR (15 downto 0);
           InstructionOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component DeMux16_2 is
    Port ( sel : in  STD_LOGIC;
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Output2 : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Mux16_2 is
    Port ( SEL : in  STD_LOGIC;
           Input1   : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input2   : in  STD_LOGIC_VECTOR (15 downto 0);
           Output  : out STD_LOGIC_VECTOR (15 downto 0));
end component;
signal InstructionAdress, DataAdressbuss, DataAdressForOut, DataAdressForIn: STD_LOGIC_VECTOR (15 downto 0);
signal DataEmpty,DataEmpty2, DTrans1,DTrans2,DataInBusy, DataOutBusy : STD_LOGIC;
signal SetOutputDataAdress, SetInputDataAdress : STD_LOGIC;
begin
DataBusy <= DataInBusy or DataOutBusy;

DTrans <= DTrans1 or DTrans2;
DPReadWrite <= DataOutBusy;
InstructionBuffer : InstManager port map (RST, DequeueInstruction,IPReady, SetInstAdress, Clk, AdressBus, IPReadBus
														,InstructionEmpty, InstructionBusy, ITrans,InstAdress, InstructionBus);
DataInBuffer : InstManager port map (RST, DequeueData, DPReady, SetInputDataAdress, Clk, AdressBus, DPReadBus
														,DataEmpty, DataInBusy, DTrans1,DataAdressForIn , DataOutBus);
DataOutBuffer : MemoryOutManager port map (Clk,RST, SetOutputDataAdress, EnqueueData, DPReady, AdressBus, DataInBus,
														 DataEmpty2, DataOutBusy, DTrans2, 
														 DPWriteBus, DataAdressForOut); 

--Demux: DeMux16_2 port map (SetDataAdress, AdressBus, InstructionAdress, DataAdressbuss);
SetOutputDataAdress <= (not sel(0)) and SetDataAdress;
SetInputDataAdress <=  (sel(0)) and SetDataAdress;
Mux : Mux16_2 port map (sel(0), DataAdressForOut, DataAdressForIn, DataAdress);
end Behavioral;

