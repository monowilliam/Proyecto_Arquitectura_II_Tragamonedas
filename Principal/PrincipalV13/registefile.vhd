library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registefile is
	generic(
		BusValores : natural;
		tr : natural
	);
	port
	(
		clk,we	: in  std_logic;
		data_in	: in  unsigned(BusValores-1 downto 0); 	
		addrR1,addrR2 : in unsigned(tr-1 downto 0);	
		data_outR1 : out unsigned(BusValores-1 downto 0);
		data_outR2 : out unsigned(BusValores-1 downto 0)
	);
end entity;

architecture arch_RegisterFile of registefile is
	
	signal REGISTER_0 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_1 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_2 : unsigned(BusValores-1 downto 0) := "00000000000010";
	signal REGISTER_3 : unsigned(BusValores-1 downto 0) := "00000000000011";
	signal REGISTER_4 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_5 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_6 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_7 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_8 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_9 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_10 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_11 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_12 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_13 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_14 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);
	signal REGISTER_15 : unsigned(BusValores-1 downto 0) := to_unsigned(0,14);

begin
	process(clk) is
		begin		
					if(falling_edge(clk)) then
							if we = '1' then
							case addrR1 is
									when "0000" =>
										REGISTER_0 <= data_in;
									when "0001" =>
										REGISTER_1 <= data_in;
									when "0010" =>
										REGISTER_2 <= data_in;
									when "0011" =>
										REGISTER_3 <= data_in;
									when "0100" =>
										REGISTER_4 <= data_in;
									when "0101" =>
										REGISTER_5 <= data_in;
									when "0110" =>
										REGISTER_6 <= data_in;
									when "0111" =>
										REGISTER_7 <= data_in;
									when "1000" =>
										REGISTER_8 <= data_in;
									when "1001" =>
										REGISTER_9 <= data_in;
									when "1010" =>
										REGISTER_10 <= data_in;
									when "1011" =>
										REGISTER_11 <= data_in;
									when "1100" =>
										REGISTER_12 <= data_in;
									when "1101" =>
										REGISTER_13 <= data_in;
									when "1110" =>
										REGISTER_14 <= data_in;
									when "1111" =>
										REGISTER_15 <= data_in;
							end case;
							end if;
					end if;	
						case addrR1 is
									when "0000" =>
										data_outR1 <= REGISTER_0;
									when "0001" =>
										data_outR1 <= REGISTER_1;
									when "0010" =>
										data_outR1 <= REGISTER_2;
									when "0011" =>
										data_outR1 <= REGISTER_3;
									when "0100" =>
										data_outR1 <= REGISTER_4;
									when "0101" =>
										data_outR1 <= REGISTER_5;
									when "0110" =>
										data_outR1 <= REGISTER_6;
									when "0111" =>
										data_outR1 <= REGISTER_7;
									when "1000" =>
										data_outR1 <= REGISTER_8;
									when "1001" =>
										data_outR1 <= REGISTER_9;
									when "1010" =>
										data_outR1 <= REGISTER_10;
									when "1011" =>
										data_outR1 <= REGISTER_11;
									when "1100" =>
										data_outR1 <= REGISTER_12;
									when "1101" =>
										data_outR1 <= REGISTER_13;
									when "1110" =>
										data_outR1 <= REGISTER_14;
									when "1111" =>
										data_outR1 <= REGISTER_15;
						end case;				
						case addrR2 is
									when "0000" =>
										data_outR2 <= REGISTER_0;
									when "0001" =>
										data_outR2 <= REGISTER_1;
									when "0010" =>
										data_outR2 <= REGISTER_2;
									when "0011" =>
										data_outR2 <= REGISTER_3;
									when "0100" =>
										data_outR2 <= REGISTER_4;
									when "0101" =>
										data_outR2 <= REGISTER_5;
									when "0110" =>
										data_outR2 <= REGISTER_6;
									when "0111" =>
										data_outR2 <= REGISTER_7;
									when "1000" =>
										data_outR2 <= REGISTER_8;
									when "1001" =>
										data_outR2 <= REGISTER_9;
									when "1010" =>
										data_outR2 <= REGISTER_10;
									when "1011" =>
										data_outR2 <= REGISTER_11;
									when "1100" =>
										data_outR2 <= REGISTER_12;
									when "1101" =>
										data_outR2 <= REGISTER_13;
									when "1110" =>
										data_outR2 <= REGISTER_14;
									when "1111" =>
										data_outR2 <= REGISTER_15;
						end case;
	end process;	
end architecture;

