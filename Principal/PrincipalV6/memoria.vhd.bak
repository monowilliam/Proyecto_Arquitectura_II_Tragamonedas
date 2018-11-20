library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memoria is
port(
	clk : in std_logic;
	address: in integer range 0 to 127;
	data_out : out std_logic_vector(25 downto 0)
);
end entity;

architecture mem_arc of memoria is
signal reg_address: integer range 0 to 127;
type memoria is array(0 to 127) of std_logic_vector(25 downto 0);
signal my_rom : memoria;
attribute ram_init_file : string;
attribute ram_init_file of my_rom: signal is "mem.mif";
begin
	process(clk) is
	begin
		if(rising_edge(clk)) then
			reg_address <= address;
		end if;
	end process;
	data_out <= my_rom(reg_address);
end architecture;