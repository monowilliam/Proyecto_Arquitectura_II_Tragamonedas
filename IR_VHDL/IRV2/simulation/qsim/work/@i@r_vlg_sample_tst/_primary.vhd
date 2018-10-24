library verilog;
use verilog.vl_types.all;
entity IR_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        instruccion     : in     vl_logic_vector(25 downto 0);
        WIR             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end IR_vlg_sample_tst;
