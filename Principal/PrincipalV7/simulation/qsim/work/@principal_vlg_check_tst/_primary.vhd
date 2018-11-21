library verilog;
use verilog.vl_types.all;
entity Principal_vlg_check_tst is
    port(
        instruccionMomento: in     vl_logic_vector(25 downto 0);
        ledsR           : in     vl_logic_vector(9 downto 0);
        ledsV           : in     vl_logic_vector(7 downto 0);
        nclk            : in     vl_logic;
        Op              : in     vl_logic_vector(3 downto 0);
        printPC         : in     vl_logic_vector(7 downto 0);
        printPCYES      : in     vl_logic;
        salidaBoton     : in     vl_logic;
        SS0             : in     vl_logic_vector(6 downto 0);
        SS1             : in     vl_logic_vector(6 downto 0);
        SS2             : in     vl_logic_vector(6 downto 0);
        SS3             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Principal_vlg_check_tst;
