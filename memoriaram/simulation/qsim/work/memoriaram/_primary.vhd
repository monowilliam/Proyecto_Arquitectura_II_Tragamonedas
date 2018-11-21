library verilog;
use verilog.vl_types.all;
entity memoriaram is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        data_in         : in     vl_logic_vector(25 downto 0);
        address         : in     vl_logic_vector(6 downto 0);
        data_out        : out    vl_logic_vector(25 downto 0)
    );
end memoriaram;
