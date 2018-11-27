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
		BusInstruc : natural; -- Tamaño del bus de instruccion 26
		tr : natural;  		  -- Tamaño rs y rt 4
		tc :  natural;		  -- Tamaño constante 14
		top : natural);       -- Tamaño opcode 4
port(
	instruccion : in std_logic_vector(BusInstruc-1 downto 0);
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