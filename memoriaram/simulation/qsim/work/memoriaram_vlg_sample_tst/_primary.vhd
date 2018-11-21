library verilog;
use verilog.vl_types.all;
entity memoriaram_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        data_in         : in     vl_logic_vector(25 downto 0);
        we              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memoriaram_vlg_sample_tst;
