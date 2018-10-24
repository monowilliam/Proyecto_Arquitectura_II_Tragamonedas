library verilog;
use verilog.vl_types.all;
entity IR is
    port(
        clk             : in     vl_logic;
        instruccion     : in     vl_logic_vector(25 downto 0);
        rs              : out    vl_logic_vector(3 downto 0);
        rt              : out    vl_logic_vector(3 downto 0);
        const           : out    vl_logic_vector(13 downto 0);
        opcode          : out    vl_logic_vector(3 downto 0);
        WIR             : in     vl_logic
    );
end IR;
