library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity registefile is
	generic(
		BusValores : natural; --14
		tr: natural
	);
port(
	clk, we : in std_logic;
	data_in : in std_logic_vector(BusValores-1 downto 0);
	addressR1,addressR2: in integer range 0 to 15;
	data_outR1,data_outR2 : out std_logic_vector(BusValores-1 downto 0)
);
end entity;

architecture registefile_arc of registefile is
type tregistro is array(0 to 15) of std_logic_vector(BusValores-1 downto 0);
signal registef : tregistro :=(
	0	=> "00000000000000", 
	1 	=> "00100010010000", 
	2 	=> "00000000000010", 
	3 	=> "00000000000011", 
	4 	=> "00000000000000",
	5 	=> "00000000000000",
	6 	=> "00000000000000",
	7 	=> "00000000000000",
	8 	=> "00000000000000",
	9 	=> "00000000000000",
	10 => "00000000000000", 
	11	=> "00000000000000", 
	12 => "00000000000000", 
	13	=> "00000000000000", 
	14	=> "00000000000000",
	15	=> "00000000000000"
);
begin
	process(clk) is
	begin
		if(rising_edge(clk)) then
			if (we='1') then
				registef(addressR1) <= data_in;
			end if;
			data_outR1 <= registef(addressR1);
			data_outR2 <= registef(addressR2);
		end if;
	end process;
end architecture;