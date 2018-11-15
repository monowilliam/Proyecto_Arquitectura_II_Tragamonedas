library verilog;
use verilog.vl_types.all;
entity PCounter is
    port(
        clk             : in     vl_logic;
        WE              : in     vl_logic;
        PCin            : in     vl_logic_vector(7 downto 0);
        PCact           : out    vl_logic_vector(7 downto 0)
    );
end PCounter;
