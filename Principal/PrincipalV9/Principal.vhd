library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity Principal is
generic (
	BusValores: natural := 14; 
	BusInstruc: natural :=26; 
	BusAdressIns: natural := 8; 
	tr: natural :=4;
	tc :natural :=14;
	top :natural :=4;
	BusAdressVal :natural := 5
);
port (
	clk: in std_logic;
	nclk: out std_logic;
	switches0, switches1 : in std_logic_vector(3 downto 0);
	switches2 : in std_logic_vector(1 downto 0);	
	SS0,SS1,SS2,SS3 : out std_logic_vector(6 downto 0);
	EnterButton : in std_logic;
	ledsR : out std_logic_vector (9 downto 0) :="0000000000";
	ledsV : out std_logic_vector (7 downto 0) :="00000000"
);
end entity;

architecture Principal_arch of principal is 
component divFrec is
port(
	clk : in std_logic;
	nclk : out std_logic
);
end component;
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
generic(
	BusInstruc: natural
);
port(
	clk : in std_logic;
	address: in integer range 0 to 255;
	data_out : out std_logic_vector(BusInstruc-1 downto 0)
);
end component;
component memoriaram is
generic(BusValores: natural);
port(
	clk, we, re : in std_logic;
	data_in : in std_logic_vector(BusValores-1 downto 0);
	address: in integer range 0 to 31;
	data_out : out std_logic_vector(BusValores-1 downto 0)
);
end component; 
--En realidad es de 8
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
	Output : out std_logic_vector(BusValores-1 downto 0);
	we : in std_logic
);
end component;
component registefile is
	generic(
		BusValores : natural;
		tr: natural
	);
port(
	clk, we : in std_logic;
	data_in : in std_logic_vector(BusValores-1 downto 0);
	addrR1,addrR2: in std_logic_vector(tr-1 downto 0);
	data_outR1,data_outR2 : out std_logic_vector(BusValores-1 downto 0)
);
end component;
component PCounter is
    generic(
	 tambus : integer
	 );
port(
	 clk, WE : in std_logic;
	 PCin : in std_logic_vector(tambus-1 downto 0);
	 PCact : out std_logic_vector(tambus-1 downto 0)
);
end component;
component sumPC is
	generic(
	Wide : natural
	);  -- Tamaño de los datos 
port(
	PCant : in std_logic_vector(Wide-1 downto 0);
	PCsig : out std_logic_vector(Wide-1 downto 0)
);
end component;
component UC is
generic(
	top : natural
);
port (
	Opcode : in std_logic_vector(top-1 downto 0);
	Clk : in std_logic;
	PCWrite,Beq,Bne,Bgt,Jump,WIR,Dg,WRF,AluSrcA,DatSel,RMD,WMD,WALuOut : out std_logic;
	botonEnter : in std_logic;
	AluOP : out std_logic_vector(1 downto 0);
	IO : out std_logic_vector(1 downto 0)
);
end component;
component mostrar is generic (
		BusValores : natural := 14 );
	Port (
		--boton : in  std_logic;
		numeroVector : in std_logic_vector(BusValores-1 downto 0);
		segmento0, segmento1, segmento2, segmento3 : out std_logic_vector(6 downto 0)
);
end component;
component randomSegmento is
port(
   boton : in  std_logic;    	 
	segmento1, segmento2, Segmento3, Segmento4 : out std_logic_vector (6 downto 0);
	ledsRojos : out std_logic_vector (9 downto 0);
	ledsVerdes : out std_logic_vector (7 downto 0)
);
end component;

component sieteS is
  generic(
   BusValores : natural
  );
  port (
	clk: in std_logic;
	--entrada : in std_logic_vector(BusValores-1 downto 0);
	switches0, switches1 : in std_logic_vector(3 downto 0);
	switches2 : in std_logic_vector(1 downto 0);
	iSS0, iSS1, iSS2, iSS3 : out std_logic_vector(6 downto 0);
	Output : out std_logic_vector(BusValores-1 downto 0);
	bot : in std_logic;
	botout : out std_logic
);
end component;
component MuxSS is 
port(
	Sel : in std_logic_vector(1 downto 0);
	R0,R1,R2,R3 : in std_logic_vector(6 downto 0); -- Random
	I0,I1,I2,I3 : in std_logic_vector(6 downto 0); -- Ingresar valor
	M0,M1,M2,M3 : in std_logic_vector(6 downto 0); -- Mostrar valor
	S0,S1,S2,S3 : out std_logic_vector(6 downto 0); -- Salidas a los 7 segmentos
	ledInV : in std_logic_vector(7 downto 0);
	ledInR : in std_logic_vector(9 downto 0);
	ledV : out std_logic_vector(7 downto 0);
	ledR : out std_logic_vector(9 downto 0)
);
end component;
----- Señales de control
signal WIR : std_logic;
signal WRF : std_logic;
signal AluSrcA,DatSel : std_logic;
signal AluOp : std_logic_vector (1 downto 0);
signal WMD : std_logic;
signal RMD : std_logic;
signal DG : std_logic;
signal Beq : std_logic;
signal Jump : std_logic;
signal Bne : std_logic;
signal Bgt : std_logic;
signal PCWrite,PCyes : std_logic;
signal selMuxPC : std_logic;
signal WAluOut : std_logic;
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
signal MemOut : std_logic_vector(BusValores-1 downto 0); -- Salida memoria de datos
signal DatosRF : std_logic_vector(BusValores-1 downto 0); -- Salida del mux que va al RF para escribir 
signal contPC,PCout,PCnew : std_logic_vector(BusAdressIns-1 downto 0); -- Entrada y salidas del pc y el sumador del pc
signal entrada : std_logic_vector(BusValores-1 downto 0);
signal IO : std_logic_vector(1 downto 0) := "00";
signal dr0,dr1,dr2,dr3,di0,di1,di2,di3,dm0,dm1,dm2,dm3 : std_logic_vector(6 downto 0); -- Al mux de los siete segmentos
signal botonUC : std_logic;
signal busLedsR :std_logic_vector(9 downto 0);
signal busLedsV :std_logic_vector(7 downto 0);
signal neclock : std_logic;
begin
--Mapeo puertos------------------------
	newclock: divFrec port map (clk=>clk,nclk=>neclock);
	memoriaIns: memoria generic map(BusInstruc=>BusInstruc) port map (clk => clk, address=>to_integer(unsigned(PCOut)),data_out=>ins);
	irP: IR generic map (BusInstruc=>BusInstruc, tr=>tr, tc => tc, top => top)
	port map(clk => clk,instruccion=>ins, rs=>rs,rt=>rt,const=>const, opcode=>opcode, WIR => WIR);
	RegisterF: registefile generic map (BusValores=>BusValores,tr=>tr)
	port map(clk => clk, we =>WRF, data_in => muldatos,addrR1=>rs,addrR2=>rt,data_outR1=>toA,data_outR2=>toB);
	RegistroA : Registro generic map (BusValores => BusValores)
	port map(clk=>clk, A=>toA,Output => SA,we =>'1');
	RegistroB: Registro generic map (BusValores => BusValores)
	port map(clk=>clk,A=>toB,Output=>SB,we => '1');
	MuxA: Mux14 generic map (BusValores => BusValores)
	port map(Sel => AluSrcA, A=>SA, B=>const,Output=>mux2Alu);
	ALU1: ALU generic map (BusValores => BusValores)
	port map(S => AluOp,A=>mux2Alu,B=>SB,Z=>Z,N=>N,OUTPUT=>SAlu);
	ALUOut : Registro generic map (BusValores=>BusValores)
	port map(clk=>clk,A=>SAlu,Output=>SAluOut,we=>WALuOut);
	MuxB : Mux14 generic map (BusValores=>BusValores)
	port map(Sel=>DatSel,A=>SA,B=>entrada,Output=>muxmem);
	MemDatos : memoriaram generic map (BusValores=>BusValores) 
	port map (clk=>clk,we=>wmd,re=>rmd,data_in=>muxmem,address=>to_integer(unsigned(SAluOut)),data_out=>MemOut);
	MuxRF : Mux14 generic map (BusValores=>BusValores)
	port map(Sel=>DG,A=>SAluOut,B=>MemOut,Output=>DatosRF);
	MuxPC : Mux12 generic map(BusAdressIns=>BusAdressIns)
	port map(Sel=>SelMuxPC,A=>const(BusAdressIns-1 downto 0),B=>PCNew,Output=>contPC);
	PC : PCounter generic map(tambus => BusAdressIns)
	port map(clk=>clk,WE=>PCyes,PCin=>contPC,PCact=>PCout);
	PCsum: sumPC generic map(Wide=>BusAdressIns)
	port map(PCant=>PCout,PCsig=>PCnew);
	SelMuxPC <= NOT((Beq AND Z)OR(Bne AND NOT(Z))OR((NOT Z) AND (Bgt AND (NOT N))));
	PCyes <= ((Beq AND Z)OR(Bne AND NOT(Z))OR((NOT Z) AND (Bgt AND (NOT N)))) OR PCwrite;
	UnidadControl : UC generic map(top=>top)
	port map(Opcode=>opcode,Clk=>clk,PCWrite=>PCWrite,Beq=>Beq,Bne=>Bne,Bgt=>Bgt,Jump=>Jump,WIR=>WIR,Dg=>DG,WRF=>WRF,AluSrcA=>AluSrcA,DatSel=>DatSel,RMD=>RMD,WMD=>WMD,WAluOut=>WAluOut,botonEnter=>botonUC,AluOp=>AluOp,IO=>IO);
	mostrarNum : mostrar generic map (BusValores=>BusValores)
	port map(numeroVector=>MemOut,segmento0=>dm0,segmento1=>dm1,segmento2=>dm2,segmento3=>dm3);
	ranSeg : randomSegmento 
	port map(boton=>EnterButton,segmento1=>dr0,segmento2=>dr1,segmento3=>dr2,segmento4=>dr3,ledsRojos=>BusLedsR,ledsVerdes=>BusLedsV);
	apuestaOIngreso : sieteS generic map (BusValores => BusValores) 
	port map (clk => neclock,switches0=>switches0, bot=> enterButton, botout=>botonUC, switches1 => switches1, switches2=>switches2,iSS0=>di0,iSS1=>di1,iSS2=>di2,iSS3=>di3,Output=>entrada);
	MuxSevenSeg : MuxSS
	port map(Sel=>IO,R0=>dr0,R1=>dr1,R2=>dr2,R3=>dr3,I0=>di0,I1=>di1,I2=>di2,I3=>di3,M0=>dm0,M1=>dm1,M2=>dm2,
	M3=>dm3,S0=>SS0,S1=>SS1,S2=>SS2,S3=>SS3,ledV=>ledsV,ledR=>ledsR,ledInV=>BusLedsV,ledInR=>BusLedsR);
-----------------------------------------------------------
end architecture;

