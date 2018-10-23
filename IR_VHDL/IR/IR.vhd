library ieee;
use ieee.std_logic_1164.all, ieee.std_logic_unsigned.all;


entity IR is generic(
		wideinst : natural := 26; -- Tamaño del bus de instruccion
		tr : natural := 4;  		  -- Tamaño rs y rt
		tc :  natural := 14;		  -- Tamaño constante
		top : natural := 4);       -- Tamaño opcode
port(
	instruccion : in std_logic_vector(wideinst-1 downto 0);
	rs,rt : out std_logic_vector(tr-1 downto 0);
	const : out std_logic_vector(tc-1 downto 0);
	opcode : out std_logic_vector(top-1 downto 0);
	WIR : in std_logic
);
end entity;

architecture IR_arc of IR is
begin
		opcode <= instruccion(25 downto 22) when WIR = '1';
		rs <= instruccion(21 downto 18) when WIR = '1';
		rt <= instruccion(17 downto 14) when WIR = '1';
		const <= instruccion (13 downto 0) when WIR = '1';
end architecture;