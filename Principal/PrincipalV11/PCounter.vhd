-----------------------------------------
-- Actividad : Creación de PC
-- Autores: GRUPO 03 
--				Jose Danilo Melgarejo
--				Juan Camilo Vanegas
--				William Aguirre
--				Hector Amature
-- Fecha : 15/11/2018
-- Curso : Arquitectura de Computadores II
-- Archivo : PCounter.vhd
-----------------------------------------
-- Descripcion : Creación de un PC
-----------------------------------------
-- Cambios : primera version 15/11/2018
-----------------------------------------
Library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--DEFINICIÓN DE LA ENTIDAD
Entity PCounter is generic(
	tambus : natural );  -- Tamaño de los datos 
port(
	clk, WE : in std_logic;
	PCin : in std_logic_vector(tambus-1 downto 0);
	PCact : out std_logic_vector(tambus-1 downto 0)
);
end entity;

architecture PCounter_arc of PCounter is
begin
	PCact <= PCin when rising_edge(clk) AND WE='1';
end architecture;