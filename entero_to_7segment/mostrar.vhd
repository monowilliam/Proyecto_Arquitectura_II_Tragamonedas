library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity mostrar is generic (
		BusValores : natural := 14 );
	Port (
		boton : in  std_logic;
		numeroVector : in std_logic_vector(BusValores-1 downto 0);
		segmento0, segmento1, segmento2, segmento3 : out std_logic_vector(6 downto 0)
	);
end mostrar;

architecture Behavioral of mostrar is
	signal vector_tmp : std_logic_vector(BusValores-1 downto 0);
begin
	
	vector_tmp <= numeroVector;
segment : process(boton)
	variable numero, unidades, decenas, centenas, miles : integer;
	begin 
		
	if (boton'event and boton='1') then
		numero := to_integer(unsigned(vector_tmp));
		miles := numero/1000;
		centenas := numero/100;
		centenas := (centenas mod 10);
		decenas := numero/10;
		decenas := (decenas mod 10);
		unidades := (numero mod 10);
	end if;
	
	case unidades is
		when 0 => segmento0 <= "1000000";
		when 1 => segmento0 <= "1111001";
		when 2 => segmento0 <= "0100100";
		when 3 => segmento0 <= "0110000";
		when 4 => segmento0 <= "0011001";
		when 5 => segmento0 <= "0010010";
		when 6 => segmento0 <= "0000010";
		when 7 => segmento0 <= "1111000";
		when 8 => segmento0 <= "0000000";
		when 9 => segmento0 <= "0010000";
		when others => segmento0 <= "1111111"; -- Nada
	end case;
		
	case decenas is
		when 0 => segmento1 <= "1000000";
		when 1 => segmento1 <= "1111001";
		when 2 => segmento1 <= "0100100";
		when 3 => segmento1 <= "0110000";
		when 4 => segmento1 <= "0011001";
		when 5 => segmento1 <= "0010010";
		when 6 => segmento1 <= "0000010";
		when 7 => segmento1 <= "1111000";
		when 8 => segmento1 <= "0000000";
		when 9 => segmento1 <= "0010000";
		when others => segmento1 <= "1111111"; -- Nada
	end case;
		
	case centenas is
		when 0 => segmento2 <= "1000000";
		when 1 => segmento2 <= "1111001";
		when 2 => segmento2 <= "0100100";
		when 3 => segmento2 <= "0110000";
		when 4 => segmento2 <= "0011001";
		when 5 => segmento2 <= "0010010";
		when 6 => segmento2 <= "0000010";
		when 7 => segmento2 <= "1111000";
		when 8 => segmento2 <= "0000000";
		when 9 => segmento2 <= "0010000";
		when others => segmento2 <= "1111111"; -- Nada
	end case;
		
	case miles is
		when 0 => segmento3 <= "1000000";
		when 1 => segmento3 <= "1111001";
		when 2 => segmento3 <= "0100100";
		when 3 => segmento3 <= "0110000";
		when 4 => segmento3 <= "0011001";
		when 5 => segmento3 <= "0010010";
		when 6 => segmento3 <= "0000010";
		when 7 => segmento3 <= "1111000";
		when 8 => segmento3 <= "0000000";
		when 9 => segmento3 <= "0010000";
		when others => segmento3 <= "1111111"; -- Nada
	end case;
end process;

end Behavioral;