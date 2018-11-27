library verilog;
use verilog.vl_types.all;
entity Principal_vlg_check_tst is
    port(
        ledsR           : in     vl_logic_vector(9 downto 0);
        ledsV           : in     vl_logic_vector(7 downto 0);
        nclk            : in     vl_logic;
        PrintaddressIns : in     vl_logic_vector(7 downto 0);
        PrintAluOut     : in     vl_logic_vector(13 downto 0);
        PrintDatosRF    : in     vl_logic_vector(13 downto 0);
        Printins        : in     vl_logic_vector(25 downto 0);
        PrintIO         : in     vl_logic_vector(1 downto 0);
        PrintMemOut     : in     vl_logic_vector(13 downto 0);
        Printopcode     : in     vl_logic_vector(3 downto 0);
        PrintPCout      : in     vl_logic_vector(7 downto 0);
        Printrs         : in     vl_logic_vector(3 downto 0);
        Printrt         : in     vl_logic_vector(3 downto 0);
        PrintSA         : in     vl_logic_vector(13 downto 0);
        PrintSB         : in     vl_logic_vector(13 downto 0);
        PrinttoA        : in     vl_logic_vector(13 downto 0);
        PrinttoB        : in     vl_logic_vector(13 downto 0);
        PrintWRF        : in     vl_logic;
        SS0             : in     vl_logic_vector(6 downto 0);
        SS1             : in     vl_logic_vector(6 downto 0);
        SS2             : in     vl_logic_vector(6 downto 0);
        SS3             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Principal_vlg_check_tst;
