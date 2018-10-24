-----------------------------------------
-- Actividad : Creacion de la IR
-- Autores: GRUPO 03 
--				Jose Danilo Melgarejo
--				Juan Camilo Vanegas
--				William Aguirre
--				Hector Amature
-- Fecha : 22/10/2018
-- Curso : Arquitectura de Computadores II
-- Archivo : IR.vhd
-----------------------------------------
-- Descripcion : Creación de la primera IR en vhdl
-----------------------------------------
-- Cambios : primera version 22/10/2018
--				 segunda version agregacion del clock y comentarios con encabezado 24/10/2018
-----------------------------------------
library ieee;
use ieee.std_logic_1164.all, ieee.std_logic_unsigned.all;


entity IR is generic(
		wideinst : natural := 26; -- Tamaño del bus de instruccion
		tr : natural := 4;  		  -- Tamaño rs y rt
		tc :  natural := 14;		  -- Tamaño constante
		top : natural := 4);       -- Tamaño opcode
port(
	clk : in std_logic;
	instruccion : in std_logic_vector(wideinst-1 downto 0);
	rs,rt : out std_logic_vector(tr-1 downto 0);
	const : out std_logic_vector(tc-1 downto 0);
	opcode : out std_logic_vector(top-1 downto 0);
	WIR : in std_logic
);
end entity;

architecture IR_arc of IR is
begin

		opcode <= instruccion(25 downto 22) when WIR = '1' and rising_edge(clk);
		rs <= instruccion(21 downto 18) when WIR = '1' and rising_edge(clk);
		rt <= instruccion(17 downto 14) when WIR = '1' and rising_edge(clk);
		const <= instruccion (13 downto 0) when WIR = '1' and rising_edge(clk);

end architecture;