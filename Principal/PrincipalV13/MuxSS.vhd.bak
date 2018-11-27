Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--DEFINICIÓN DE LA ENTIDAD
Entity MuxSS is 
port(
	Sel : in std_logic_vector(1 downto 0);
	R0,R1,R2,R3 : in std_logic_vector(6 downto 0); -- Random
	I0,I1,I2,I3 : in std_logic_vector(6 downto 0); -- Ingresar valor
	M0,M1,M2,M3 : in std_logic_vector(6 downto 0); -- Mostrar valor
	S0,S1,S2,S3 : out std_logic_vector(6 downto 0);
	entradaVRandom : in std_logic_vector(13 downto 0);
	entradaVIngreso : in std_logic_vector(13 downto 0);
	ledInV : in std_logic_vector(7 downto 0);
	ledInR : in std_logic_vector(9 downto 0);
	ledV : out std_logic_vector(7 downto 0);
	ledR : out std_logic_vector(9 downto 0);
	entrada : out std_logic_vector(13 downto 0)
	--OpCode: in std_logic_vector(3 downto 0)
);
end entity;

architecture MuxSS_arc of MuxSS is
begin

 S0 <= I0 when Sel="10" else
		 R0 when Sel="00" else
		 M0 when Sel="11" else
		 "1111111" when Sel="01";
 S1 <= I1 when Sel="10" else
		 R1 when Sel="00" else
		 M1 when Sel="11" else
		 "1111111" when Sel="01";	
 S2 <= I2 when Sel="10" else
		 R2 when Sel="00" else
		 M2 when Sel="11" else
		 "1111111" when Sel="01";	 
 S3 <= I3 when Sel="10" else
		 R3 when Sel="00"  else
		 M3 when Sel="11" else
		 "1111111" when Sel="01";
 ledV <= ledInV when Sel="00" else
			"00000000";
 ledR <= ledInR when Sel="00"  else
			"0000000000";
 entrada <= entradaVRandom when Sel="00" else
				entradaVIngreso when Sel="10" else
				"00000000000000";
end architecture;