library ieee;
    use ieee.std_logic_1164.all;
	 USE ieee.numeric_std.ALL;
	 use ieee.std_logic_arith.all;
	 
entity sieteS is
  generic(
   BusValores : natural
  );
  port (
	clk: in std_logic;
	--entrada : in std_logic_vector(BusValores-1 downto 0);
	switches, switches1 : in std_logic_vector(3 downto 0);
	switches2 : in std_logic_vector(1 downto 0);
	iSS0, iSS1, iSS2, iSS3 : out std_logic_vector(6 downto 0);
	Output : out std_logic_vector(BusValores-1 downto 0)
);
end entity;

architecture sieteS_arq of sieteS is
begin

	process (clk)
		variable apuesta : integer := 0;
		variable apuesta1 : integer := 0;
		variable apuesta2 : integer := 0;
	begin
		iSS3 <= "1111111";
		case switches is
			when "0000" => apuesta := 0;
			when "0001" => apuesta := 1;
			when "0010" => apuesta := 2;
			when "0011" => apuesta := 3;
			when "0100" => apuesta := 4;
			when "0101" => apuesta := 5;
			when "0110" => apuesta := 6;
			when "0111" => apuesta := 7;
			when "1000" => apuesta := 8;
			when "1001" => apuesta := 9;
			when others => apuesta := 0; -- Nada
		end case;
		case switches1 is
			when "0000" => apuesta1 := 0;
			when "0001" => apuesta1 := 1;
			when "0010" => apuesta1 := 2;
			when "0011" => apuesta1 := 3;
			when "0100" => apuesta1 := 4;
			when "0101" => apuesta1 := 5;
			when "0110" => apuesta1 := 6;
			when "0111" => apuesta1 := 7;
			when "1000" => apuesta1 := 8;
			when "1001" => apuesta1 := 9;
			when others => apuesta1 := 0; -- Nada
		end case;
		case switches2 is
			when "00" => apuesta2 := 0;
			when "01" => apuesta2 := 1;
			when "10" => apuesta2 := 2;
			when "11" => apuesta2 := 3;
			when others => apuesta2 := 0; -- Nada
		end case;
		
		--SS0
		if apuesta = 0 then
		  iSS0 <= "1000000";
		end if;
		if apuesta = 1 then
		  iSS0 <= "1111001";
		end if;
		if apuesta = 2 then
		  iSS0 <= "0100100";
		end if;
		if apuesta = 3 then
		  iSS0 <= "0110000";
		end if;
		if apuesta = 4 then
		  iSS0 <= "0011001";
		end if;
		if apuesta = 5 then
		  iSS0 <= "0010010";
		end if;
		if apuesta = 6 then
		  iSS0 <= "0000010";
		end if;
		if apuesta = 7 then
		  iSS0 <= "1111000";
		end if;
		if apuesta = 8 then
		  iSS0 <= "0000000";
		end if;
		if apuesta = 9 then
		  iSS0 <= "0010000";
		end if;
	
	
	--SS1
		if apuesta1 = 0 then
		  iSS1 <= "1000000";
		end if;
		if apuesta1 = 1 then
		  iSS1 <= "1111001";
		end if;
		if apuesta1 = 2 then
		  iSS1 <= "0100100";
		end if;
		if apuesta1 = 3 then
		  iSS1 <= "0110000";
		end if;
		if apuesta1 = 4 then
		  iSS1 <= "0011001";
		end if;
		if apuesta1 = 5 then
		  iSS1 <= "0010010";
		end if;
		if apuesta1 = 6 then
		  iSS1 <= "0000010";
		end if;
		if apuesta1 = 7 then
		  iSS1 <= "1111000";
		end if;
		if apuesta1 = 8 then
		  iSS1 <= "0000000";
		end if;
		if apuesta1 = 9 then
		  iSS1 <= "0010000";
		end if;
		
		--SS2
		if apuesta2 = 0 then
		  iSS2 <= "1000000";
		end if;
		if apuesta2 = 1 then
		  iSS2 <= "1111001";
		end if;
		if apuesta2	= 2 then
		  iSS2 <= "0100100";
		end if;
		if apuesta2 = 3 then
		  iSS2 <= "0110000";
		end if;
		Output<=conv_std_logic_vector(apuesta+apuesta1*10+apuesta2*100,BusValores);
	end process;
end architecture;