library verilog;
use verilog.vl_types.all;
entity Principal is
    port(
        clk             : in     vl_logic;
        nclk            : out    vl_logic;
        switches0       : in     vl_logic_vector(3 downto 0);
        switches1       : in     vl_logic_vector(3 downto 0);
        switches2       : in     vl_logic_vector(1 downto 0);
        SS0             : out    vl_logic_vector(6 downto 0);
        SS1             : out    vl_logic_vector(6 downto 0);
        SS2             : out    vl_logic_vector(6 downto 0);
        SS3             : out    vl_logic_vector(6 downto 0);
        EnterButton     : in     vl_logic;
        ledsR           : out    vl_logic_vector(9 downto 0);
        ledsV           : out    vl_logic_vector(7 downto 0);
        PrintaddressIns : out    vl_logic_vector(7 downto 0);
        Printins        : out    vl_logic_vector(25 downto 0);
        Printrs         : out    vl_logic_vector(3 downto 0);
        Printrt         : out    vl_logic_vector(3 downto 0);
        Printopcode     : out    vl_logic_vector(3 downto 0);
        PrinttoA        : out    vl_logic_vector(13 downto 0);
        PrinttoB        : out    vl_logic_vector(13 downto 0);
        PrintSA         : out    vl_logic_vector(13 downto 0);
        PrintSB         : out    vl_logic_vector(13 downto 0);
        PrintAluOut     : out    vl_logic_vector(13 downto 0);
        PrintMemOut     : out    vl_logic_vector(13 downto 0);
        PrintWRF        : out    vl_logic;
        PrintDatosRF    : out    vl_logic_vector(13 downto 0)
    );
end Principal;
