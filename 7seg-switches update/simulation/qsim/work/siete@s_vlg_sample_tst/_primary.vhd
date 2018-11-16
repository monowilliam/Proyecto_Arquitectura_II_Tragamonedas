library verilog;
use verilog.vl_types.all;
entity sieteS_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        switches        : in     vl_logic_vector(3 downto 0);
        switches1       : in     vl_logic_vector(3 downto 0);
        switches2       : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end sieteS_vlg_sample_tst;
