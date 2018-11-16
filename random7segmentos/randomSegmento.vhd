library ieee;
    use ieee.std_logic_1164.all;
	 USE ieee.numeric_std.ALL;
	 
entity randomSegmento is
  port (
    boton : in  std_logic;    	 
	 segmento1, segmento2, Segmento3, Segmento4 : inout std_logic_vector (6 downto 0);
	 ledsRojos : out std_logic_vector (9 downto 0);
	 ledsVerdes : out std_logic_vector (7 downto 0)
  );
end entity;

architecture random_arq of randomSegmento is
    signal count_i1 : std_logic_vector (19 downto 0); 
	 signal count_i2 : std_logic_vector (19 downto 0);
	 signal count_i3 : std_logic_vector (19 downto 0);
    signal feedback1, feedback2, feedback3 	: std_logic;
	 signal seg1, seg2, seg3:std_logic_vector(2 downto 0);
	 signal seg1_tmp, seg2_tmp, seg3_tmp:std_logic_vector(6 downto 0);

begin
   feedback1 <= not(count_i1(19) xor count_i1(0));		-- LFSR size 4
	feedback2 <= not(count_i2(19) xor count_i2(0));
	feedback3 <= not(count_i3(19) xor count_i3(0));
	Segmento4 <= "1111111";

-----------ALEATORIO DEL SEGUNDO 7-SEGMENTOS---------------
aleatorioSeg : process (boton) 
	variable temp_num1, temp_num2, temp_num3 : integer;
	begin
	if (boton'event and boton='1') then
		count_i1 <= count_i1(18 downto 0) & feedback1;
		count_i2 <= count_i2(18 downto 0) & feedback2;
		count_i3 <= count_i3(18 downto 0) & feedback3;
	end if;
	
	temp_num1 := to_integer(unsigned(count_i1));
	temp_num1 := (temp_num1 mod 9);
	seg1 <= std_logic_vector(to_unsigned(temp_num1, seg1'length));
	
	temp_num2 := to_integer(unsigned(count_i2));
	temp_num2 := (temp_num2 mod 9);
	temp_num2 := temp_num2 *13;
	seg2 <= std_logic_vector(to_unsigned(temp_num2, seg2'length));
	
	temp_num3 := to_integer(unsigned(count_i3));
	temp_num3 := (temp_num3 mod 9);
	temp_num3 := temp_num3 * 7;
	seg3 <= std_logic_vector(to_unsigned(temp_num3, seg3'length));
	
	case seg1 is
		when "000" => segmento1 <= "0111111";
		when "001" => segmento1 <= "1110111";
		when "010" => segmento1 <= "1111110";
		when "011" => segmento1 <= "1111110";
		when "100" => segmento1 <= "1110111";
		when "101" => segmento1 <= "0111111";
		when "110" => segmento1 <= "1111110";
		when "111" => segmento1 <= "1110111";
	end case;
	
	case seg2 is
		when "000" => segmento2 <= "0111111";
		when "001" => segmento2 <= "1110111";
		when "010" => segmento2 <= "1111110";
		when "011" => segmento2 <= "1111110";
		when "100" => segmento2 <= "1110111";
		when "101" => segmento2 <= "0111111";
		when "110" => segmento2 <= "1111110";
		when "111" => segmento2 <= "1110111";
	end case;
	
	case seg3 is
		when "000" => segmento3 <= "0111111";
		when "001" => segmento3 <= "1110111";
		when "010" => segmento3 <= "1111110";
		when "011" => segmento3 <= "1111110";
		when "100" => segmento3 <= "1110111";
		when "101" => segmento3 <= "0111111";
		when "110" => segmento3 <= "1111110";
		when "111" => segmento3 <= "1110111";
	end case;
	
	seg1_tmp <= segmento1;
	seg2_tmp <= segmento2;
	seg3_tmp <= segmento3;


	if( (seg1_tmp="0111111" and seg2_tmp="0111111" and seg3_tmp="0111111") or (seg1_tmp="1110111" and seg2_tmp="0111111" and seg3_tmp="1111110") or (seg3_tmp="1110111" and seg2_tmp="0111111" and seg1_tmp="11111110") or (seg1_tmp="1110111" and seg2_tmp="1110111" and seg3_tmp="1110111") or (seg1_tmp="1111110" and seg2_tmp="1111110" and seg3_tmp="1111110") )then
		ledsVerdes <= "11111111";
		ledsRojos <= "0000000000";
	else
		ledsRojos <= "1111111111";
		ledsVerdes <= "00000000";
	end if;
	
	
end process aleatorioSeg;




end architecture;