-- Actividad : Creación de sumador del PC
-- Autores: GRUPO 03 
--				Jose Danilo Melgarejo
--				Juan Camilo Vanegas
--				William Aguirre
--				Hector Amature
-- Fecha : 15/11/2018
-- Curso : Arquitectura de Computadores II
-- Archivo : sumPC.vhd
-----------------------------------------
-- Descripcion : Creación de sumador para el PC
-----------------------------------------
-- Cambios : primera version 15/11/2018
-----------------------------------------
Library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--DEFINICIÓN DE LA ENTIDAD
Entity sumPC is generic(
	Wide : natural);  -- Tamaño de los datos 
port(
	PCant : in std_logic_vector(Wide-1 downto 0);
	PCsig : out std_logic_vector(Wide-1 downto 0)
);
end entity;

architecture sumPC_arc of sumPC is
begin
	PCSig <= PCant + 1;
end architecture;