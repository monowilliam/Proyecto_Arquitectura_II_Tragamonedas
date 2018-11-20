library verilog;
use verilog.vl_types.all;
entity randomSegmento_vlg_sample_tst is
    port(
        boton           : in     vl_logic;
        clk             : in     vl_logic;
        segmento1       : in     vl_logic_vector(6 downto 0);
        segmento2       : in     vl_logic_vector(6 downto 0);
        Segmento3       : in     vl_logic_vector(6 downto 0);
        Segmento4       : in     vl_logic_vector(6 downto 0);
        sampler_tx      : out    vl_logic
    );
end randomSegmento_vlg_sample_tst;
