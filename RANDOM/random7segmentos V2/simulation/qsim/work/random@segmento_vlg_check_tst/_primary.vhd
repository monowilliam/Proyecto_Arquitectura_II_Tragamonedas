library verilog;
use verilog.vl_types.all;
entity randomSegmento_vlg_check_tst is
    port(
        ledsRojos       : in     vl_logic_vector(9 downto 0);
        ledsVerdes      : in     vl_logic_vector(7 downto 0);
        segmento1       : in     vl_logic_vector(6 downto 0);
        segmento2       : in     vl_logic_vector(6 downto 0);
        Segmento3       : in     vl_logic_vector(6 downto 0);
        Segmento4       : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end randomSegmento_vlg_check_tst;
