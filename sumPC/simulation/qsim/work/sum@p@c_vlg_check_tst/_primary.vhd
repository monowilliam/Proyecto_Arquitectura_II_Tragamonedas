library verilog;
use verilog.vl_types.all;
entity sumPC_vlg_check_tst is
    port(
        PCsig           : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end sumPC_vlg_check_tst;
