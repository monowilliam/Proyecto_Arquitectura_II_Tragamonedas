library verilog;
use verilog.vl_types.all;
entity Mux12 is
    port(
        Sel             : in     vl_logic;
        A               : in     vl_logic_vector(11 downto 0);
        B               : in     vl_logic_vector(11 downto 0);
        Output          : out    vl_logic_vector(11 downto 0)
    );
end Mux12;
