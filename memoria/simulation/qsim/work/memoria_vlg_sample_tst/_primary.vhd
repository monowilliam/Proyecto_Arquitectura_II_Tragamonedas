library verilog;
use verilog.vl_types.all;
entity memoria_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memoria_vlg_sample_tst;
