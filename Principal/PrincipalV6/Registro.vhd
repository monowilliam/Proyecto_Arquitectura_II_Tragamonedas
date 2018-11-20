-----------------------------------------
-- Actividad : Creación de registros individuales
-- Autores: GRUPO 03 
--				Jose Danilo Melgarejo
--				Juan Camilo Vanegas
--				William Aguirre
--				Hector Amature
-- Fecha : 24/10/2018
-- Curso : Arquitectura de Computadores II
-- Archivo : Registro.vhd
-----------------------------------------
-- Descripcion : Creación de un registro
-----------------------------------------
-- Cambios : primera version 24/10/2018
-----------------------------------------
Library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--DEFINICIÓN DE LA ENTIDAD
Entity Registro is generic(
	BusValores : natural := 14 );  -- Tamaño de los datos 
port(
	clk : in std_logic;
	A : in std_logic_vector(BusValores-1 downto 0);
	Output : out std_logic_vector(BusValores-1 downto 0)
);
end entity;

architecture Registro_arc of Registro is
begin
	Output <= A when rising_edge(clk);
end architecture;