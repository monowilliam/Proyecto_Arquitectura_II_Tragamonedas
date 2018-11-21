library verilog;
use verilog.vl_types.all;
entity Mux14_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(13 downto 0);
        B               : in     vl_logic_vector(13 downto 0);
        Sel             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Mux14_vlg_sample_tst;
