library verilog;
use verilog.vl_types.all;
entity sieteS is
    port(
        clk             : in     vl_logic;
        switches        : in     vl_logic_vector(3 downto 0);
        switches1       : in     vl_logic_vector(3 downto 0);
        switches2       : in     vl_logic_vector(1 downto 0);
        SS0             : out    vl_logic_vector(6 downto 0);
        SS1             : out    vl_logic_vector(6 downto 0);
        SS2             : out    vl_logic_vector(6 downto 0);
        SS3             : out    vl_logic_vector(6 downto 0);
        Output          : out    vl_logic_vector(13 downto 0)
    );
end sieteS;
