library verilog;
use verilog.vl_types.all;
entity memoria is
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector(6 downto 0);
        data_out        : out    vl_logic_vector(25 downto 0)
    );
end memoria;
