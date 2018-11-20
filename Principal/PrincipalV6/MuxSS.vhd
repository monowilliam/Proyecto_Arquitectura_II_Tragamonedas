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
	S0,S1,S2,S3 : out std_logic_vector(6 downto 0)
);
end entity;

architecture MuxSS_arc of MuxSS is
begin
 S0 <= R0 when Sel="01" else
		 I0 when Sel="10" else
		 M0 when Sel="11" else
		 "1111111" when Sel="00";
 S1 <= R1 when Sel="01" else
		 I1 when Sel="10" else
		 M1 when Sel="11" else
		 "1111111" when Sel="00";	
 S2 <= R2 when Sel="01" else
		 I2 when Sel="10" else
		 M2 when Sel="11" else
		 "1111111" when Sel="00";	 
 S3 <= R3 when Sel="01" else
		 I3 when Sel="10" else
		 M3 when Sel="11" else
		 "1111111" when Sel="00";
end architecture;