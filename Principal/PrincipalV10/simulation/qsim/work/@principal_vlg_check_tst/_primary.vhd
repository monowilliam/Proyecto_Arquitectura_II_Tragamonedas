library verilog;
use verilog.vl_types.all;
entity Principal_vlg_check_tst is
    port(
        ledsR           : in     vl_logic_vector(9 downto 0);
        ledsV           : in     vl_logic_vector(7 downto 0);
        nclk            : in     vl_logic;
        printEntradaMem : in     vl_logic_vector(13 downto 0);
        printIns        : in     vl_logic_vector(25 downto 0);
        printIO         : in     vl_logic_vector(1 downto 0);
        SS0             : in     vl_logic_vector(6 downto 0);
        SS1             : in     vl_logic_vector(6 downto 0);
        SS2             : in     vl_logic_vector(6 downto 0);
        SS3             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Principal_vlg_check_tst;
