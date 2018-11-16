library verilog;
use verilog.vl_types.all;
entity randomSegmento is
    port(
        clk             : in     vl_logic;
        segmento1       : out    vl_logic_vector(6 downto 0);
        segmento2       : out    vl_logic_vector(6 downto 0);
        Segmento3       : out    vl_logic_vector(6 downto 0);
        Segmento4       : out    vl_logic_vector(6 downto 0)
    );
end randomSegmento;
