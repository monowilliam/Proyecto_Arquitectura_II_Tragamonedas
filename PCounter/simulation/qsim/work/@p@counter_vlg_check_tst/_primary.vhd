library verilog;
use verilog.vl_types.all;
entity PCounter_vlg_check_tst is
    port(
        PCact           : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end PCounter_vlg_check_tst;
