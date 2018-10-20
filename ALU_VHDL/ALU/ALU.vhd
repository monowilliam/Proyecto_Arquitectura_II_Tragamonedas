-----------------------------------------
-- Actividad : Creación de la primera ALU del proyecto
-- Autores: GRUPO 03 
--				Jose Danilo Melgarejo
--				Juan Camilo Vanegas
--				William Aguirre
--				Hector Amature
-- Fecha : 19/10/2018
-- Curso : Arquitectura de Computadores II
-- Archivo : ALU.vhd
-----------------------------------------
-- Descripcion : Creación de la primera ALU en vhdl
-----------------------------------------
-- Cambios : primera version 19/10/2018
-----------------------------------------
Library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--DEFINICIÓN DE LA ENTIDAD
Entity ALU is --generic(
--	TAMAÑO_BUS : natural := 16 ); 
port(
	S : in std_logic_vector(1 downto 0);
	A : in std_logic_vector(15 downto 0);
	B : in std_logic_vector(15 downto 0);
	OUTPUT : out std_logic_vector(15 downto 0)
);
end entity;

--DEFINICIÓN DE LA ARQUITECTURA
Architecture ALU_arq of ALU is
begin

--Operaciones de la ALU
	OUTPUT <= A + B when S = "00" else -- + suma
				 A - B when S = "01" else -- - resta
				 std_logic_vector(resize(unsigned(A) * unsigned(B),16)) when S = "10" else -- X multiplicacion
				 A when S = "11"; 		  -- O+ operacion paso
			
end Architecture;