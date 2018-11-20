library verilog;
use verilog.vl_types.all;
entity Principal_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        EnterButton     : in     vl_logic;
        switches0       : in     vl_logic_vector(3 downto 0);
        switches1       : in     vl_logic_vector(3 downto 0);
        switches2       : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end Principal_vlg_sample_tst;
