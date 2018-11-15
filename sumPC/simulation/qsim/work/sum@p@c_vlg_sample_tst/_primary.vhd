library verilog;
use verilog.vl_types.all;
entity sumPC_vlg_sample_tst is
    port(
        PCant           : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end sumPC_vlg_sample_tst;
