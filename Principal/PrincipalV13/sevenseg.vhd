library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity sevenseg is
	port(
		seg0, seg1, seg2, seg3 : in std_logic_vector(6 downto 0);
		seg0out, seg1out, seg2out, seg3out : out std_logic_vector(6 downto 0)
	);
end sevenseg;

architecture sevenseg_arch of sevenseg is
begin
	seg0out<=seg0;
	seg1out<=seg1;
	seg2out<=seg2;
	seg3out<=seg3;
end architecture;