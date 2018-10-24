library verilog;
use verilog.vl_types.all;
entity Registro is
    port(
        clk             : in     vl_logic;
        A               : in     vl_logic_vector(13 downto 0);
        Output          : out    vl_logic_vector(13 downto 0)
    );
end Registro;
