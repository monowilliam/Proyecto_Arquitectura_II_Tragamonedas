library verilog;
use verilog.vl_types.all;
entity randomSegmento is
    port(
        clk             : in     vl_logic;
        boton           : in     vl_logic;
        segmento1       : inout  vl_logic_vector(6 downto 0);
        segmento2       : inout  vl_logic_vector(6 downto 0);
        Segmento3       : inout  vl_logic_vector(6 downto 0);
        Segmento4       : inout  vl_logic_vector(6 downto 0);
        ledsRojos       : out    vl_logic_vector(9 downto 0);
        ledsVerdes      : out    vl_logic_vector(7 downto 0)
    );
end randomSegmento;
