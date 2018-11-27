library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity divFrec is
port(
	clk : in std_logic;
	nclk : out std_logic;
	BotonIn : in std_logic;
	BotonOut : inout std_logic := '1'
);
end entity;
architecture divFrec_arc of divFrec is
signal clk_sig : std_logic;
shared variable cont : integer :=0;
begin
p1:process (clk) is	
	begin
		if (rising_edge (clk)) then
			if BotonOut='0' then 
					BotonOut<='1';
			end if;
			if (cont = 15000000) then
				clk_sig <= not clk_sig;
				cont := 0;
				if BotonIn = '0' and BotonOut ='1' then
					BotonOut<='0';
				end if;
			else 
				cont:= cont + 1;
			end if;
		end if;
end process p1;
	nclk <= clk_sig;
end architecture;