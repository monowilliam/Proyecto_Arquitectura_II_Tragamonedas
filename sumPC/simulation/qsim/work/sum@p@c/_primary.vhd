library verilog;
use verilog.vl_types.all;
entity sumPC is
    port(
        PCant           : in     vl_logic_vector(7 downto 0);
        PCsig           : out    vl_logic_vector(7 downto 0)
    );
end sumPC;
