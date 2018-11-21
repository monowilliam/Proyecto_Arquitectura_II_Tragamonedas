library verilog;
use verilog.vl_types.all;
entity Mux14 is
    port(
        Sel             : in     vl_logic;
        A               : in     vl_logic_vector(13 downto 0);
        B               : in     vl_logic_vector(13 downto 0);
        Output          : out    vl_logic_vector(13 downto 0)
    );
end Mux14;
