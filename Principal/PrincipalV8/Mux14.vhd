-----------------------------------------
-- Actividad : Creación de multiplexor
-- Autores: GRUPO 03 
--				Jose Danilo Melgarejo
--				Juan Camilo Vanegas
--				William Aguirre
--				Hector Amature
-- Fecha : 24/10/2018
-- Curso : Arquitectura de Computadores II
-- Archivo : Mux14.vhd
-----------------------------------------
-- Descripcion : Creación de un multiplexor de 2 a 1 de 14 bits
-----------------------------------------
-- Cambios : primera version 24/10/2018
-----------------------------------------
Library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--DEFINICIÓN DE LA ENTIDAD
Entity Mux14 is generic(
	BusValores : natural);  -- Tamaño de los datos 14
port(
	Sel : in std_logic;
	A,B : in std_logic_vector(BusValores-1 downto 0);
	Output : out std_logic_vector(BusValores-1 downto 0)
);
end entity;

architecture Mux14_arc of Mux14 is
begin
	Output <= A when Sel='0' else
				 B when Sel='1';
end architecture;