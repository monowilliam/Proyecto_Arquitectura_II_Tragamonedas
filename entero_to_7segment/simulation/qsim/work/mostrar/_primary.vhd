library verilog;
use verilog.vl_types.all;
entity mostrar is
    port(
        boton           : in     vl_logic;
        numeroVector    : in     vl_logic_vector(13 downto 0);
        segmento0       : out    vl_logic_vector(6 downto 0);
        segmento1       : out    vl_logic_vector(6 downto 0);
        segmento2       : out    vl_logic_vector(6 downto 0);
        segmento3       : out    vl_logic_vector(6 downto 0);
        n1              : inout  vl_logic_vector(31 downto 0);
        n2              : inout  vl_logic_vector(31 downto 0);
        n3              : inout  vl_logic_vector(31 downto 0);
        n4              : inout  vl_logic_vector(31 downto 0)
    );
end mostrar;
