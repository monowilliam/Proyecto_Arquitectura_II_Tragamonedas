library verilog;
use verilog.vl_types.all;
entity PCounter_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        PCin            : in     vl_logic_vector(7 downto 0);
        WE              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PCounter_vlg_sample_tst;
