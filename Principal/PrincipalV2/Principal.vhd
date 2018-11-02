library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all,ieee.numeric_std.all;

entity Principal is
generic (
	BusValores: natural := 14; 
	BusInstruc: natural :=26; 
	BusAdressIns: natural := 8; 
	tr: natural :=4;
	tc :natural :=14;
	top natural :4);
port (
	clk: in std_logic;
	entrada : in std_logic_vector(BusValores-1 downto 0)
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
	clk, we, re : in std_logic;
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
component registefile is
	generic(
		BusValores : natural 
		tr: natural
	);
port(
	clk, we : in std_logic;
	data_in : in std_logic_vector(BusValores-1 downto 0);
	addressR1,addressR2: in std_logic_vector(tr-1 downto 0);
	data_outR1,data_outR2 : out std_logic_vector(BusValores-1 downto 0)
);
end component;
----- Señales de control
signal WIR : std_logic;
signal WRF : std_logic;
signal AluSrcA,DatSel : std_logic;
signal AluOp : std_logic_vector (1 downto 0);
signal WMD,RMD : std_logic;
-----
signal addressIns : integer range 0 to 255;
signal ins : std_logic_vector (BusInstruc-1 downto 0);
signal rs,rt : std_logic_vector (tr-1 downto 0);
signal const : std_logic_vector (tc-1 downto 0);
signal opcode : std_logic_vector (top-1 downto 0);
signal muldatos : std_logic_vector (BusValores-1 downto 0); -- Multiplexor para la entrada de datos en el RF
signal toA,toB,SA,SB : std_logic_vector (BusValores-1 downto 0); -- Del RF a los registros A y B 
signal mux2Alu,muxmem : std_logic_vector (BusValores-1 downto 0);
signal Z,N : std_logic; --Valores de comparacion de la Alu
signal SAlu,SAluOut : std_logic_vector (BusValores-1 downto 0);-- Salida de la Alu
signal MemOut : std_logic_vector(Busvalores-1 downto 0); -- Salida memoria de datos
begin
	memoriaIns: memoria port map (clk => clk, address=>addressIns,data_out=>ins);
	irP: IR generic map (BusInstruc=>BusInstruc, tr=>tr, tc => tc, top => top)
	port map (clk => clk,instruccion=>ins, rs=>rs,rt=>rt,const=>const, opcode=>opcode, WIR => WIR);
	RegisterF: registefile generic map (BusValores=>BusValores,tr=>tr)
	port map (clk => clk, we =>WRF, data_in => muldatos,addressR1=>to_integer(rs),addressR2=>to_integer(rt),data_outR1=>toA,data_outR2=>toB);
	RegistroA : Registro generic map (BusValores => BusValores)
	port map (clk=>clk, A=>toA,Output => SA);
	RegistroB: Registro generic map (BusValores => BusValores)
	port map (clk=>clk,A=>toB,Output=>SB);
	MuxA: Mux14 generic map (BusValores => BusValores)
	port map (Sel => AluSrcA, A=>SA, B=>const,Output=>mux2Alu);
	ALU1: ALU generic map (BusValores => BusValores)
	port map (S => AluOp,A=>mux2Alu,B=>SB,Z=>Z,N=>N,OUTPUT=>SAlu);
	ALUOut : Registro generic map (BusValores=>BusValores)
	port map (clk=>clk,A=>SAlu,Output=>SAluOut);
	MuxB : Mux14 generic map (BusValores=>BusValores)
	port map (Sel=>DatSel,A=>SA,B=>entrada,Output=>muxmem);
	MemDatos : memoriaram port map (clk=clk,we=>wmd,re=>rmd,data_in=>muxmem,address=>SAluOut,data_out=>MemOut);
end architecture;
component ALU is generic(BusValores: natural);