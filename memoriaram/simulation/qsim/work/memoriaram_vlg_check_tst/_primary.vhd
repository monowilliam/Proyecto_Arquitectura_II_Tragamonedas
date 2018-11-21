library verilog;
use verilog.vl_types.all;
entity memoriaram_vlg_check_tst is
    port(
        data_out        : in     vl_logic_vector(25 downto 0);
        sampler_rx      : in     vl_logic
    );
end memoriaram_vlg_check_tst;
