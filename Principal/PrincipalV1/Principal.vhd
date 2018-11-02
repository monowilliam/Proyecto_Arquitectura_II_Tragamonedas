library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity Principal is
generic (
	BusValores: natural := 14; 
	BusInstruc: natural :=26; 
	BusAdressIns: natural := 8; 
	tr: natural :=4;
	tc :natural :=14;
	top natural :4);
port (
	clk: in std_logic
);
end entity;

architecture Principal_arch of principal is 
component ALU is generic(BusValores: natural);
port(
	S : in std_logic_vector(1 downto 0);
	A : in std_logic_vector(BusValores-1 downto 0);
	B : in std_logic_vector(BusValores-1 downto 0);
	Z,N : out std_logic;
	OUTPUT : out std_logic_vector(BusValores-1 downto 0)
);
end component;
component IR is generic(
		BusInstruc : natural; 
		tr : natural := 4;  		 
		tc :  natural := 14;		  
		top : natural := 4);   
port(
	clk : in std_logic;
	instruccion : in std_logic_vector(BusInstruc-1 downto 0);
	rs,rt : out std_logic_vector(tr-1 downto 0);
	const : out std_logic_vector(tc-1 downto 0);
	opcode : out std_logic_vector(top-1 downto 0);
	WIR : in std_logic
);
end component;
component memoria is
port(
	clk : in std_logic;
	address: in integer range 0 to 255;
	data_out : out std_logic_vector(25 downto 0)
);
end component;
component memoriaram is
port(
	clk, we : in std_logic;
	data_in : in std_logic_vector(25 downto 0);
	address: in integer range 0 to 255;
	data_out : out std_logic_vector(25 downto 0)
);
end component;
component Mux12 is generic(
	BusAdressIns : natural);
port(
	Sel : in std_logic;
	A,B : in std_logic_vector(BusAdressIns-1 downto 0);
	Output : out std_logic_vector(BusAdressIns-1 downto 0)
);
end component;
component Mux14 is generic(
	BusValores : natural); 
port(
	Sel : in std_logic;
	A,B : in std_logic_vector(BusValores-1 downto 0);
	Output : out std_logic_vector(BusValores-1 downto 0)
);
end component;
component Registro is generic(
	BusValores : natural);
port(
	clk : in std_logic;
	A : in std_logic_vector(BusValores-1 downto 0);
	Output : out std_logic_vector(BusValores-1 downto 0)
);
end component;
----- Señales de control
signal WIR : std_logic;
-----
signal addressIns : integer range 0 to 255;
signal ins : std_logic_vector (BusInstruc-1 downto 0);
signal rs,rt : std_logic_vector (tr-1 downto 0);
signal const : std_logic_vector (tc-1 downto 0);
signal opcode : std_logic_vector (top-1 downto 0);
begin
	memoriaIns: memoria port map (clk => clk, address=>addressIns,data_out=>ins);
	irP: IR generic map (BusInstruc=>BusInstruc, tr=>tr, tc => tc, top => top)
	port map (clk => clk,instruccion=>ins, rs=>rs,rt=>rt,const=>const, opcode=>opcode, WIR => WIR);
end architecture;

