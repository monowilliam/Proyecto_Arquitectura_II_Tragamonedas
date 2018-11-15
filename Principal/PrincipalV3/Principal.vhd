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
	entrada : in std_logic_vector(BusValores-1 downto 0);
	switches : in std_logic_vector(7 downto 0);
	SSU,SSD,SST,SSC : out std_logic_vector(6 downto 0)
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
	Output : out std_logic_vector(BusValores-1 downto 0)
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
signal DatosRF :std_logic_vector(BusValores-1 downto 0); -- Salida del mux que va al RF para escribir 
signal contPC,PCout,PCnew : std_logic_vector(BusAdressIns-1 downto 0); -- Entrada y salidas del pc y el sumador del pc
begin
--Mapeo puertos------------------------
	memoriaIns: memoria generic map(BusInstruc=>BusInstruc) port map (clk => clk, address=>addressIns,data_out=>ins);
	irP: IR generic map (BusInstruc=>BusInstruc, tr=>tr, tc => tc, top => top)
	port map (clk => clk,instruccion=>ins, rs=>rs,rt=>rt,const=>const, opcode=>opcode, WIR => WIR);
	RegisterF: registefile generic map (BusValores=>BusValores,tr=>tr)
	port map (clk => clk, we =>WRF, data_in => muldatos,addrR1=>rs,addrR2=>rt,data_outR1=>toA,data_outR2=>toB);
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
	MemDatos : memoriaram generic map (BusValores=>BusValores) port map (clk=>clk,we=>wmd,re=>rmd,data_in=>muxmem,address=>to_integer(unsigned(SAluOut)),data_out=>MemOut);
	MuxRF : Mux14 generic map (BusValores=>BusValores)
	port map (Sel=>DG,A=>SAluOut,B=>MemOut,Output=>DatosRF);
	MuxPC : Mux12 generic map(BusAdressIns=>BusAdressIns)
	port map(Sel=>SelMuxPC,A=>const(7 downto 0),B=>PCNew,Output=>contPC);
	PC : PCounter generic map(tambus => BusAdressIns)
	port map(clk=>clk,WE=>PCyes,PCin=>contPC,PCact=>PCout);
	PCsum: sumPC generic map(Wide=>BusAdressIns)
	port map(PCant=>PCout,PCsig=>PCnew);
	SelMuxPC <= NOT((Beq AND Z)OR(Bne AND NOT(Z))OR((NOT Z) AND (Bgt AND (NOT N))));
	PCyes <= ((Beq AND Z)OR(Bne AND NOT(Z))OR((NOT Z) AND (Bgt AND (NOT N)))) OR PCwrite;
	process (switches)
		variable apuesta : integer := 0;
		variable mil,cien,diez,uno : integer;
	begin
		if switches(0)='1' then
		 apuesta := apuesta + 1;
		end if;
		if switches(1)='1' then
		 apuesta := apuesta + 5;
		end if;
		if switches(2)='1' then
		 apuesta := apuesta + 10;
		end if;
		if switches(3)='1' then
		 apuesta := apuesta + 50;
		end if;
		if switches(4)='1' then
		 apuesta := apuesta + 100;
		end if;
		if switches(5)='1' then
		 apuesta := apuesta + 500;
		end if;
		if switches(6)='1' then
		 apuesta := apuesta + 1000;
		end if;
		if switches(7)='1' then
		 apuesta := apuesta + 5000;
		end if;
		mil := apuesta/1000;
		cien := ((apuesta/100) MOD 10);
		diez := ((apuesta/10) MOD 10);
		uno := (apuesta MOD 10);
		-- SS Mil
		if mil = 0 then
		  SSC <= "1000000";
		end if;
		if mil = 1 then
		  SSC <= "1111001";
		end if;
		if mil = 2 then
		  SSC <= "0100100";
		end if;
		if mil = 3 then
		  SSC <= "0000110";
		end if;
		if mil = 4 then
		  SSC <= "0011001";
		end if;
		if mil = 5 then
		  SSC <= "0010010";
		end if;
		if mil = 6 then
		  SSC <= "0000010";
		end if;
		if mil = 7 then
		  SSC <= "0111000";
		end if;
		if mil = 8 then
		  SSC <= "0000000";
		end if;
		if mil = 9 then
		  SSC <= "0010000";
		end if;
		-- SS Cien
		if cien = 0 then
		  SSC <= "1000000";
		end if;
		if cien = 1 then
		  SSC <= "1111001";
		end if;
		if cien = 2 then
		  SSC <= "0100100";
		end if;
		if cien = 3 then
		  SSC <= "0000110";
		end if;
		if cien = 4 then
		  SSC <= "0011001";
		end if;
		if cien = 5 then
		  SSC <= "0010010";
		end if;
		if cien = 6 then
		  SSC <= "0000010";
		end if;
		if cien = 7 then
		  SSC <= "0111000";
		end if;
		if cien = 8 then
		  SSC <= "0000000";
		end if;
		if cien = 9 then
		  SSC <= "0010000";
		end if;
		-- SS Diez 
		if diez = 0 then
		  SSC <= "1000000";
		end if;
		if diez = 1 then
		  SSC <= "1111001";
		end if;
		if diez = 2 then
		  SSC <= "0100100";
		end if;
		if diez = 3 then
		  SSC <= "0000110";
		end if;
		if diez = 4 then
		  SSC <= "0011001";
		end if;
		if diez = 5 then
		  SSC <= "0010010";
		end if;
		if diez = 6 then
		  SSC <= "0000010";
		end if;
		if diez = 7 then
		  SSC <= "0111000";
		end if;
		if diez = 8 then
		  SSC <= "0000000";
		end if;
		if diez = 9 then
		  SSC <= "0010000";
		end if;
		-- SS uno
		if uno = 0 then
		  SSC <= "1000000";
		end if;
		if uno = 1 then
		  SSC <= "1111001";
		end if;
		if uno = 2 then
		  SSC <= "0100100";
		end if;
		if uno = 3 then
		  SSC <= "0000110";
		end if;
		if uno = 4 then
		  SSC <= "0011001";
		end if;
		if uno = 5 then
		  SSC <= "0010010";
		end if;
		if uno = 6 then
		  SSC <= "0000010";
		end if;
		if uno = 7 then
		  SSC <= "0111000";
		end if;
		if uno = 8 then
		  SSC <= "0000000";
		end if;
		if uno = 9 then
		  SSC <= "0010000";
		end if;
	end process;
	
-----------------------------------------------------------
end architecture;

